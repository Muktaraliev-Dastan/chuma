///фреймворк
import 'package:flutter/material.dart';

///модели
import 'package:chum2/src/common/models/order.dart';


///внутренние виджеты
import '../short_order_card.dart';

class HistoryView extends StatelessWidget {
  final List<Order> orders;

  const HistoryView({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...orders
            .where((order) => ((order.orderStatus == OrderStatus.processed)))
            .map(
              (order) => ShortOrderCard(order: order),
        )
            .toList(),
        const SizedBox(height: 20,)
      ],
    );
  }
}