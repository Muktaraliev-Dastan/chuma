///либы
import 'package:equatable/equatable.dart';

///модели
import 'package:chum2/src/common/models/models.dart';

///Евенты списка продуктов домашнего экрана
abstract class HomeProductEvents extends Equatable {
  const HomeProductEvents();

  @override
  List<Object?> get props => [];
}

///запрос на получение списка продуктов домашнего экрана
class HomeProductsRequested extends HomeProductEvents {}

