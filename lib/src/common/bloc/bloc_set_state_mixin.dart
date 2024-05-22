//либы
import 'package:bloc/bloc.dart' show Emittable;
import 'package:l/l.dart';

mixin SetStateMixin<State extends Object?> implements Emittable<State> {
  void setState(State state) {

    emit(state);
    l.i('сработала функция setState в SetStateMixin, был эмитирован следующий стейт: $state');
  }
}
