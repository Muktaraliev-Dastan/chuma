//фреймворк
import 'dart:async';

//либы
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:l/l.dart';

//утилиты, хелперы
import 'package:chum2/src/common/bloc/bloc_set_state_mixin.dart';
import 'package:chum2/src/common/utils/error_handler.dart';

//репозитории
import '../data/authentication_repository.dart';

//модели
import '../model/user_entity.dart';

//фризед
part 'authentication_bloc.freezed.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const AuthenticationEvent._();

  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => 0;

  ///эмитить текущий стейз юзера в зависимости от фаерзейба
  @literal
  const factory AuthenticationEvent.emitUserState() = _EmitUserState;

  ///войти с помощью гугла
  @literal
  const factory AuthenticationEvent.signInWithGoogle() = _SignInWithGoogleEvent;

  ///разлогиниться
  @literal
  const factory AuthenticationEvent.logOut() = _LogOutEvent;
}

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  UserEntity get user => super.map<UserEntity>(
        authenticated: (final state) => state.user,
        error: (final state) => state.user,
        inProgress: (final state) => state.user,
        notAuthenticated: (_) => const NotAuthenticatedUser(),
      );

  bool get isAuthenticated => user.isAuthenticated;

  bool get isNotAuthenticated => !isAuthenticated;

  bool get hasError => maybeMap(orElse: () => false, error: (_) => true);

  bool get inProgress => maybeMap(orElse: () => false, inProgress: (_) => true);

  bool get needsToUpdateUserFields =>
      maybeMap(orElse: () => false, authenticated: (state) => state.user.isNew);

  ///разлогинен
  @literal
  const factory AuthenticationState.notAuthenticated({
    @Default(NotAuthenticatedUser()) final NotAuthenticatedUser user,
  }) = _NotAuthenticatedState;

  ///аутентифицирован
  @literal
  const factory AuthenticationState.authenticated({
    required final AuthenticatedUser user,
    final String? loginMethod,
  }) = _AuthenticatedState;

  ///находится в процессе аутентификации
  @literal
  const factory AuthenticationState.inProgress(
          {@Default(NotAuthenticatedUser()) final UserEntity user}) =
      _InProgressAuthenticationState;

  ///ошибка в процессе аутентификации
  @literal
  const factory AuthenticationState.error({
    @Default(NotAuthenticatedUser()) final UserEntity user,
    @Default('An error occurred during authentication') final String message,
  }) = _ErrorAuthenticationState;

  @factory
  // ignore: invalid_factory_method_impl
  static AuthenticationState fromUser(final UserEntity user) =>
      user.when<AuthenticationState>(
          authenticated: (final user) =>
              AuthenticationState.authenticated(user: user),
          notAuthenticated: () => const AuthenticationState.notAuthenticated());
}

class AuthenticationBLoC
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthenticationRepository _authenticationRepository;
  StreamSubscription<void>? _authStateChangesSubscription;

  AuthenticationBLoC({
    required final IAuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.inProgress()) {
    on<AuthenticationEvent>(
      (event, emit) => event.map<Future<void>>(
        emitUserState: (_) => _emitUserState(emit),
        signInWithGoogle: (_) => _signInWithGoogle(emit),
        logOut: (_) => _logOut(emit),
      ),
      transformer: bloc_concurrency.sequential(),
    );
    _authStateChangesSubscription =
        _authenticationRepository.firebaseAuthStateChanges.listen((_) {
      add(const AuthenticationEvent.emitUserState());
    }, cancelOnError: false);
  }

  Future<void> _emitUserState(Emitter<AuthenticationState> emit) async {
    l.i('вызван _emitUserState в AuthenticationBLoC');
    var userEntity = await _authenticationRepository.getUserEntity;
    emit(AuthenticationState.fromUser(userEntity));
  }

  Future<void> _signInWithGoogle(Emitter<AuthenticationState> emit) async {
    l.i('вызван _signInWithGoogle в AuthenticationBLoC');
    if (state.isAuthenticated) return;

    emit(const AuthenticationState.inProgress());
    try {
      await _authenticationRepository.signInWithGoogle();
    } on FirebaseAuthException catch (error, stacktrace) {
      //TODO: прописать все ошибки https://firebase.google.com/docs/reference/js/v8/firebase.auth.Auth#error-codes_12
      if (error.code == 'popup-closed-by-user') {
        l.i('пользователь закрыл окно аутентификации');
      }
      emit(const AuthenticationState.error());
      l.e('an error occurred during authentication in firebase: $error',
          stacktrace);
      ErrorHandler.logError(error, stackTrace: stacktrace);
      rethrow;
    } on Object catch (error, stacktrace) {
      emit(const AuthenticationState.error());
      l.e('an error occurred during authentication in ChumServer: $error',
          stacktrace);
      ErrorHandler.logError(error, stackTrace: stacktrace);
      rethrow;
      //TODO: разобраться надо ли делать rethrow и в целом отрегулировать работу с ошибками
    }
  }

  Future<void> _logOut(Emitter<AuthenticationState> emit) async {
    l.i('вызван _logOut в AuthenticationBLoC');
    if (state.isNotAuthenticated) return;
    emit(const AuthenticationState.inProgress());
    try {
      await _authenticationRepository.logOut();
    } on FirebaseAuthException catch (error, stacktrace) {
      emit(const AuthenticationState.error());
      l.e('an error occurred during logout in Firebase: $error', stacktrace);
      ErrorHandler.logError(error, stackTrace: stacktrace);
      rethrow;
    } on Object catch (error, stacktrace) {
      emit(const AuthenticationState.error());
      l.e('an error occurred during logout in ChumServer: $error', stacktrace);
      ErrorHandler.logError(error, stackTrace: stacktrace);
      rethrow;
    }
  }
}
