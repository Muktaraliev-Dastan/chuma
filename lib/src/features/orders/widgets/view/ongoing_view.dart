///фреймворк
import 'package:flutter/material.dart';

///модели
import 'package:chum2/src/common/models/order.dart';


///внутренние виджеты
import '../short_order_card.dart';

class OngoingView extends StatelessWidget {
  final List<Order> orders;

  const OngoingView({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...orders
            .where((order) => ((order.orderStatus == OrderStatus.selection) ||
                (order.orderStatus == OrderStatus.processing)))
            .map(
              (order) => ShortOrderCard(order: order),
            )
            .toList(),
        const SizedBox(height: 20,)
      ],
    );
  }
}

