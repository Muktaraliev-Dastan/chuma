///язык
import 'dart:async';

///либы
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

///модели
import 'package:chum2/src/common/models/models.dart';

///эвенты и стейты
import 'home_products.dart';

///репозитории
import 'package:chum2/src/common/data/repositories/product_repository/product_repository.dart';

class HomeProductBloc extends Bloc<HomeProductEvents, HomeProductState> {
  final ProductRepository productRepository;

  HomeProductBloc({required this.productRepository})
      : super(HomeProductsLoadInProgress()) {
    on<HomeProductsRequested>(_onHomeProductsRequested);
  }

  Future<void> _onHomeProductsRequested(
      HomeProductsRequested event, Emitter<HomeProductState> emit) async {
    emit(HomeProductsLoadInProgress());
    final homeProductsList = await productRepository.fetchMainPageProducts();
    emit(HomeProductsLoadSuccess(homeProductsList));
  }
}
