// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emitUserState,
    required TResult Function() signInWithGoogle,
    required TResult Function() logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emitUserState,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emitUserState,
    TResult Function()? signInWithGoogle,
    TResult Function()? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmitUserState value) emitUserState,
    required TResult Function(_SignInWithGoogleEvent value) signInWithGoogle,
    required TResult Function(_LogOutEvent value) logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmitUserState value)? emitUserState,
    TResult? Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult? Function(_LogOutEvent value)? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmitUserState value)? emitUserState,
    TResult Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult Function(_LogOutEvent value)? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmitUserStateImplCopyWith<$Res> {
  factory _$$EmitUserStateImplCopyWith(
          _$EmitUserStateImpl value, $Res Function(_$EmitUserStateImpl) then) =
      __$$EmitUserStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmitUserStateImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$EmitUserStateImpl>
    implements _$$EmitUserStateImplCopyWith<$Res> {
  __$$EmitUserStateImplCopyWithImpl(
      _$EmitUserStateImpl _value, $Res Function(_$EmitUserStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

@literal
class _$EmitUserStateImpl extends _EmitUserState {
  const _$EmitUserStateImpl() : super._();

  @override
  String toString() {
    return 'AuthenticationEvent.emitUserState()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emitUserState,
    required TResult Function() signInWithGoogle,
    required TResult Function() logOut,
  }) {
    return emitUserState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emitUserState,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? logOut,
  }) {
    return emitUserState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emitUserState,
    TResult Function()? signInWithGoogle,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (emitUserState != null) {
      return emitUserState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmitUserState value) emitUserState,
    required TResult Function(_SignInWithGoogleEvent value) signInWithGoogle,
    required TResult Function(_LogOutEvent value) logOut,
  }) {
    return emitUserState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmitUserState value)? emitUserState,
    TResult? Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult? Function(_LogOutEvent value)? logOut,
  }) {
    return emitUserState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmitUserState value)? emitUserState,
    TResult Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult Function(_LogOutEvent value)? logOut,
    required TResult orElse(),
  }) {
    if (emitUserState != null) {
      return emitUserState(this);
    }
    return orElse();
  }
}

abstract class _EmitUserState extends AuthenticationEvent {
  const factory _EmitUserState() = _$EmitUserStateImpl;
  const _EmitUserState._() : super._();
}

/// @nodoc
abstract class _$$SignInWithGoogleEventImplCopyWith<$Res> {
  factory _$$SignInWithGoogleEventImplCopyWith(
          _$SignInWithGoogleEventImpl value,
          $Res Function(_$SignInWithGoogleEventImpl) then) =
      __$$SignInWithGoogleEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithGoogleEventImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$SignInWithGoogleEventImpl>
    implements _$$SignInWithGoogleEventImplCopyWith<$Res> {
  __$$SignInWithGoogleEventImplCopyWithImpl(_$SignInWithGoogleEventImpl _value,
      $Res Function(_$SignInWithGoogleEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

@literal
class _$SignInWithGoogleEventImpl extends _SignInWithGoogleEvent {
  const _$SignInWithGoogleEventImpl() : super._();

  @override
  String toString() {
    return 'AuthenticationEvent.signInWithGoogle()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emitUserState,
    required TResult Function() signInWithGoogle,
    required TResult Function() logOut,
  }) {
    return signInWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emitUserState,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? logOut,
  }) {
    return signInWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emitUserState,
    TResult Function()? signInWithGoogle,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmitUserState value) emitUserState,
    required TResult Function(_SignInWithGoogleEvent value) signInWithGoogle,
    required TResult Function(_LogOutEvent value) logOut,
  }) {
    return signInWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmitUserState value)? emitUserState,
    TResult? Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult? Function(_LogOutEvent value)? logOut,
  }) {
    return signInWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmitUserState value)? emitUserState,
    TResult Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult Function(_LogOutEvent value)? logOut,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogleEvent extends AuthenticationEvent {
  const factory _SignInWithGoogleEvent() = _$SignInWithGoogleEventImpl;
  const _SignInWithGoogleEvent._() : super._();
}

/// @nodoc
abstract class _$$LogOutEventImplCopyWith<$Res> {
  factory _$$LogOutEventImplCopyWith(
          _$LogOutEventImpl value, $Res Function(_$LogOutEventImpl) then) =
      __$$LogOutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogOutEventImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$LogOutEventImpl>
    implements _$$LogOutEventImplCopyWith<$Res> {
  __$$LogOutEventImplCopyWithImpl(
      _$LogOutEventImpl _value, $Res Function(_$LogOutEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

@literal
class _$LogOutEventImpl extends _LogOutEvent {
  const _$LogOutEventImpl() : super._();

  @override
  String toString() {
    return 'AuthenticationEvent.logOut()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emitUserState,
    required TResult Function() signInWithGoogle,
    required TResult Function() logOut,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? emitUserState,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? logOut,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emitUserState,
    TResult Function()? signInWithGoogle,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmitUserState value) emitUserState,
    required TResult Function(_SignInWithGoogleEvent value) signInWithGoogle,
    required TResult Function(_LogOutEvent value) logOut,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmitUserState value)? emitUserState,
    TResult? Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult? Function(_LogOutEvent value)? logOut,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmitUserState value)? emitUserState,
    TResult Function(_SignInWithGoogleEvent value)? signInWithGoogle,
    TResult Function(_LogOutEvent value)? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _LogOutEvent extends AuthenticationEvent {
  const factory _LogOutEvent() = _$LogOutEventImpl;
  const _LogOutEvent._() : super._();
}

/// @nodoc
mixin _$AuthenticationState {
  UserEntity get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
    required TResult Function(AuthenticatedUser user, String? loginMethod)
        authenticated,
    required TResult Function(UserEntity user) inProgress,
    required TResult Function(UserEntity user, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
    TResult? Function(AuthenticatedUser user, String? loginMethod)?
        authenticated,
    TResult? Function(UserEntity user)? inProgress,
    TResult? Function(UserEntity user, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    TResult Function(AuthenticatedUser user, String? loginMethod)?
        authenticated,
    TResult Function(UserEntity user)? inProgress,
    TResult Function(UserEntity user, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
    required TResult Function(_AuthenticatedState value) authenticated,
    required TResult Function(_InProgressAuthenticationState value) inProgress,
    required TResult Function(_ErrorAuthenticationState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
    TResult? Function(_AuthenticatedState value)? authenticated,
    TResult? Function(_InProgressAuthenticationState value)? inProgress,
    TResult? Function(_ErrorAuthenticationState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    TResult Function(_AuthenticatedState value)? authenticated,
    TResult Function(_InProgressAuthenticationState value)? inProgress,
    TResult Function(_ErrorAuthenticationState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotAuthenticatedStateImplCopyWith<$Res> {
  factory _$$NotAuthenticatedStateImplCopyWith(
          _$NotAuthenticatedStateImpl value,
          $Res Function(_$NotAuthenticatedStateImpl) then) =
      __$$NotAuthenticatedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotAuthenticatedUser user});
}

/// @nodoc
class __$$NotAuthenticatedStateImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$NotAuthenticatedStateImpl>
    implements _$$NotAuthenticatedStateImplCopyWith<$Res> {
  __$$NotAuthenticatedStateImplCopyWithImpl(_$NotAuthenticatedStateImpl _value,
      $Res Function(_$NotAuthenticatedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$NotAuthenticatedStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as NotAuthenticatedUser,
    ));
  }
}

/// @nodoc

@literal
class _$NotAuthenticatedStateImpl extends _NotAuthenticatedState {
  const _$NotAuthenticatedStateImpl({this.user = const NotAuthenticatedUser()})
      : super._();

  @override
  @JsonKey()
  final NotAuthenticatedUser user;

  @override
  String toString() {
    return 'AuthenticationState.notAuthenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotAuthenticatedStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotAuthenticatedStateImplCopyWith<_$NotAuthenticatedStateImpl>
      get copyWith => __$$NotAuthenticatedStateImplCopyWithImpl<
          _$NotAuthenticatedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
    required TResult Function(AuthenticatedUser user, String? loginMethod)
        authenticated,
    required TResult Function(UserEntity user) inProgress,
    required TResult Function(UserEntity user, String message) error,
  }) {
    return notAuthenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
    TResult? Function(AuthenticatedUser user, String? loginMethod)?
        authenticated,
    TResult? Function(UserEntity user)? inProgress,
    TResult? Function(UserEntity user, String message)? error,
  }) {
    return notAuthenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    TResult Function(AuthenticatedUser user, String? loginMethod)?
        authenticated,
    TResult Function(UserEntity user)? inProgress,
    TResult Function(UserEntity user, String message)? error,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
    required TResult Function(_AuthenticatedState value) authenticated,
    required TResult Function(_InProgressAuthenticationState value) inProgress,
    required TResult Function(_ErrorAuthenticationState value) error,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
    TResult? Function(_AuthenticatedState value)? authenticated,
    TResult? Function(_InProgressAuthenticationState value)? inProgress,
    TResult? Function(_ErrorAuthenticationState value)? error,
  }) {
    return notAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    TResult Function(_AuthenticatedState value)? authenticated,
    TResult Function(_InProgressAuthenticationState value)? inProgress,
    TResult Function(_ErrorAuthenticationState value)? error,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _NotAuthenticatedState extends AuthenticationState {
  const factory _NotAuthenticatedState({final NotAuthenticatedUser user}) =
      _$NotAuthenticatedStateImpl;
  const _NotAuthenticatedState._() : super._();

  @override
  NotAuthenticatedUser get user;
  @JsonKey(ignore: true)
  _$$NotAuthenticatedStateImplCopyWith<_$NotAuthenticatedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatedStateImplCopyWith<$Res> {
  factory _$$AuthenticatedStateImplCopyWith(_$AuthenticatedStateImpl value,
          $Res Function(_$AuthenticatedStateImpl) then) =
      __$$AuthenticatedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthenticatedUser user, String? loginMethod});
}

/// @nodoc
class __$$AuthenticatedStateImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$AuthenticatedStateImpl>
    implements _$$AuthenticatedStateImplCopyWith<$Res> {
  __$$AuthenticatedStateImplCopyWithImpl(_$AuthenticatedStateImpl _value,
      $Res Function(_$AuthenticatedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? loginMethod = freezed,
  }) {
    return _then(_$AuthenticatedStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthenticatedUser,
      loginMethod: freezed == loginMethod
          ? _value.loginMethod
          : loginMethod // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@literal
class _$AuthenticatedStateImpl extends _AuthenticatedState {
  const _$AuthenticatedStateImpl({required this.user, this.loginMethod})
      : super._();

  @override
  final AuthenticatedUser user;
  @override
  final String? loginMethod;

  @override
  String toString() {
    return 'AuthenticationState.authenticated(user: $user, loginMethod: $loginMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.loginMethod, loginMethod) ||
                other.loginMethod == loginMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, loginMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedStateImplCopyWith<_$AuthenticatedStateImpl> get copyWith =>
      __$$AuthenticatedStateImplCopyWithImpl<_$AuthenticatedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
    required TResult Function(AuthenticatedUser user, String? loginMethod)
        authenticated,
    required TResult Function(UserEntity user) inProgress,
    required TResult Function(UserEntity user, String message) error,
  }) {
    return authenticated(user, loginMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
    TResult? Function(AuthenticatedUser user, String? loginMethod)?
        authenticated,
    TResult? Function(UserEntity user)? inProgress,
    TResult? Function(UserEntity user, String message)? error,
  }) {
    return authenticated?.call(user, loginMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    TResult Function(AuthenticatedUser user, String? loginMethod)?
        authenticated,
    TResult Function(UserEntity user)? inProgress,
    TResult Function(UserEntity user, String message)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user, loginMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
    required TResult Function(_AuthenticatedState value) authenticated,
    required TResult Function(_InProgressAuthenticationState value) inProgress,
    required TResult Function(_ErrorAuthenticationState value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
    TResult? Function(_AuthenticatedState value)? authenticated,
    TResult? Function(_InProgressAuthenticationState value)? inProgress,
    TResult? Function(_ErrorAuthenticationState value)? error,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    TResult Function(_AuthenticatedState value)? authenticated,
    TResult Function(_InProgressAuthenticationState value)? inProgress,
    TResult Function(_ErrorAuthenticationState value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedState extends AuthenticationState {
  const factory _AuthenticatedState(
      {required final AuthenticatedUser user,
      final String? loginMethod}) = _$AuthenticatedStateImpl;
  const _AuthenticatedState._() : super._();

  @override
  AuthenticatedUser get user;
  String? get loginMethod;
  @JsonKey(ignore: true)
  _$$AuthenticatedStateImplCopyWith<_$AuthenticatedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InProgressAuthenticationStateImplCopyWith<$Res> {
  factory _$$InProgressAuthenticationStateImplCopyWith(
          _$InProgressAuthenticationStateImpl value,
          $Res Function(_$InProgressAuthenticationStateImpl) then) =
      __$$InProgressAuthenticationStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$InProgressAuthenticationStateImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$InProgressAuthenticationStateImpl>
    implements _$$InProgressAuthenticationStateImplCopyWith<$Res> {
  __$$InProgressAuthenticationStateImplCopyWithImpl(
      _$InProgressAuthenticationStateImpl _value,
      $Res Function(_$InProgressAuthenticationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$InProgressAuthenticationStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

@literal
class _$InProgressAuthenticationStateImpl
    extends _InProgressAuthenticationState {
  const _$InProgressAuthenticationStateImpl(
      {this.user = const NotAuthenticatedUser()})
      : super._();

  @override
  @JsonKey()
  final UserEntity user;

  @override
  String toString() {
    return 'AuthenticationState.inProgress(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgressAuthenticationStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InProgressAuthenticationStateImplCopyWith<
          _$InProgressAuthenticationStateImpl>
      get copyWith => __$$InProgressAuthenticationStateImplCopyWithImpl<
          _$InProgressAuthenticationStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
    required TResult Function(AuthenticatedUser user, String? loginMethod)
        authenticated,
    required TResult Function(UserEntity user) inProgress,
    required TResult Function(UserEntity user, String message) error,
  }) {
    return inProgress(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
    TResult? Function(AuthenticatedUser user, String? loginMethod)?
        authenticated,
    TResult? Function(UserEntity user)? inProgress,
    TResult? Function(UserEntity user, String message)? error,
  }) {
    return inProgress?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    TResult Function(AuthenticatedUser user, String? loginMethod)?
        authenticated,
    TResult Function(UserEntity user)? inProgress,
    TResult Function(UserEntity user, String message)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
    required TResult Function(_AuthenticatedState value) authenticated,
    required TResult Function(_InProgressAuthenticationState value) inProgress,
    required TResult Function(_ErrorAuthenticationState value) error,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
    TResult? Function(_AuthenticatedState value)? authenticated,
    TResult? Function(_InProgressAuthenticationState value)? inProgress,
    TResult? Function(_ErrorAuthenticationState value)? error,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    TResult Function(_AuthenticatedState value)? authenticated,
    TResult Function(_InProgressAuthenticationState value)? inProgress,
    TResult Function(_ErrorAuthenticationState value)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgressAuthenticationState extends AuthenticationState {
  const factory _InProgressAuthenticationState({final UserEntity user}) =
      _$InProgressAuthenticationStateImpl;
  const _InProgressAuthenticationState._() : super._();

  @override
  UserEntity get user;
  @JsonKey(ignore: true)
  _$$InProgressAuthenticationStateImplCopyWith<
          _$InProgressAuthenticationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorAuthenticationStateImplCopyWith<$Res> {
  factory _$$ErrorAuthenticationStateImplCopyWith(
          _$ErrorAuthenticationStateImpl value,
          $Res Function(_$ErrorAuthenticationStateImpl) then) =
      __$$ErrorAuthenticationStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user, String message});
}

/// @nodoc
class __$$ErrorAuthenticationStateImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$ErrorAuthenticationStateImpl>
    implements _$$ErrorAuthenticationStateImplCopyWith<$Res> {
  __$$ErrorAuthenticationStateImplCopyWithImpl(
      _$ErrorAuthenticationStateImpl _value,
      $Res Function(_$ErrorAuthenticationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? message = null,
  }) {
    return _then(_$ErrorAuthenticationStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@literal
class _$ErrorAuthenticationStateImpl extends _ErrorAuthenticationState {
  const _$ErrorAuthenticationStateImpl(
      {this.user = const NotAuthenticatedUser(),
      this.message = 'An error occurred during authentication'})
      : super._();

  @override
  @JsonKey()
  final UserEntity user;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.error(user: $user, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorAuthenticationStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorAuthenticationStateImplCopyWith<_$ErrorAuthenticationStateImpl>
      get copyWith => __$$ErrorAuthenticationStateImplCopyWithImpl<
          _$ErrorAuthenticationStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
    required TResult Function(AuthenticatedUser user, String? loginMethod)
        authenticated,
    required TResult Function(UserEntity user) inProgress,
    required TResult Function(UserEntity user, String message) error,
  }) {
    return error(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
    TResult? Function(AuthenticatedUser user, String? loginMethod)?
        authenticated,
    TResult? Function(UserEntity user)? inProgress,
    TResult? Function(UserEntity user, String message)? error,
  }) {
    return error?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    TResult Function(AuthenticatedUser user, String? loginMethod)?
        authenticated,
    TResult Function(UserEntity user)? inProgress,
    TResult Function(UserEntity user, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
    required TResult Function(_AuthenticatedState value) authenticated,
    required TResult Function(_InProgressAuthenticationState value) inProgress,
    required TResult Function(_ErrorAuthenticationState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
    TResult? Function(_AuthenticatedState value)? authenticated,
    TResult? Function(_InProgressAuthenticationState value)? inProgress,
    TResult? Function(_ErrorAuthenticationState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    TResult Function(_AuthenticatedState value)? authenticated,
    TResult Function(_InProgressAuthenticationState value)? inProgress,
    TResult Function(_ErrorAuthenticationState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorAuthenticationState extends AuthenticationState {
  const factory _ErrorAuthenticationState(
      {final UserEntity user,
      final String message}) = _$ErrorAuthenticationStateImpl;
  const _ErrorAuthenticationState._() : super._();

  @override
  UserEntity get user;
  String get message;
  @JsonKey(ignore: true)
  _$$ErrorAuthenticationStateImplCopyWith<_$ErrorAuthenticationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
