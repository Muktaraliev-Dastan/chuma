///либы
import 'package:equatable/equatable.dart';

///модели
import 'package:chum2/src/common/models/models.dart';

///общий стейт для всех стейтов продуктов домашних экранов
///влияет на загрузку продуктов, без категорий и промо
abstract class HomeProductState extends Equatable {
  const HomeProductState();

  ///переопределяем чтобы не было ошибки
  ///TODO: проверить можно ли не переопределять в абстрактном классе
  @override
  List<Object?> get props => [];
}

///стейт загрузки продуктов домашнего экрана
class HomeProductsLoadInProgress extends HomeProductState {}

///стейт "продукты домашнего экрана загружены"
class HomeProductsLoadSuccess extends HomeProductState {
  final List<Product> products;

  const HomeProductsLoadSuccess([this.products = const []]);

  @override
  List<Object> get props => [products];

  @override
  String toString() => 'HomeProductsLoadSuccess { products: $products }';
}

class HomeProductsLoadFailure extends HomeProductState {}
