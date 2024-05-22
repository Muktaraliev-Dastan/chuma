///модели
import 'type_of_service.dart';
import 'restaurant.dart';
import 'product.dart';

class Order {
  final TypeOfService typeOfService;
  final OrderStatus orderStatus;
  final String timeOfService;
  ///TODO: переписать timeOfService на DateTime
  // final DateTime timeOfService;
  final int total;
  final Restaurant shop;
  final List<Product> products;

  const Order({
    required this.typeOfService,
    required this.orderStatus,
    required this.timeOfService,
    required this.total,
    required this.shop,
    required this.products,
  });
}

enum OrderStatus { selection, processing, processed }

List<Order> existingOrders = [
  Order(
    typeOfService: TypeOfService.delivery,
    orderStatus: OrderStatus.selection,
    timeOfService: 'Hôm Nay ... 17.35',
    total: 128000,
    shop: existingRestaurants[0],
    products: products,
  ),
  Order(
    typeOfService: TypeOfService.inRestaurant,
    orderStatus: OrderStatus.selection,
    timeOfService: 'Hôm Nay ... 19.00',
    total: 210000,
    shop: existingRestaurants[1],
    products: products,
  ),
  Order(
    typeOfService: TypeOfService.takeAway,
    orderStatus: OrderStatus.processing,
    timeOfService: 'Hôm Nay ... 15.30',
    total: 350000,
    shop: existingRestaurants[2],
    products: products,
  ),
  Order(
    typeOfService: TypeOfService.delivery,
    orderStatus: OrderStatus.processed,
    timeOfService: '22/11/2021',
    total: 219000,
    shop: existingRestaurants[3],
    products: products,
  ),
  Order(
    typeOfService: TypeOfService.inRestaurant,
    orderStatus: OrderStatus.processed,
    timeOfService: '20/11/2021',
    total: 285000,
    shop: existingRestaurants[1],
    products: products,
  ),
];
