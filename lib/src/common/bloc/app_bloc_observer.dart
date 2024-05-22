//блок
import 'package:bloc/bloc.dart';

//логгер
import 'package:l/l.dart';

//утилиты
import 'package:chum2/src/common/utils/error_handler.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<Object?> bloc) {
    super.onCreate(bloc);
    l.vvvv('${bloc.runtimeType}()');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (event == null) return;
    l.vvvvv('${bloc.runtimeType}.add(${event.runtimeType})');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    final Object? event = transition.event;
    final Object? currentState = transition.currentState;
    final Object? nextState = transition.nextState;
    if (event == null || currentState == null || nextState == null) return;
    l.vvvvv(
        '${bloc.runtimeType} ${event.runtimeType}: ${currentState.runtimeType}->${nextState.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    l.e(error, stackTrace);
    ErrorHandler.logError(error,
        stackTrace: stackTrace, hint: 'Bloc: ${bloc.runtimeType.toString()}');
  }

  @override
  void onClose(BlocBase<Object?> bloc) {
    super.onClose(bloc);
    l.vvvv('${bloc.runtimeType}.close()');
  }
}
