///фреймворк
import 'package:flutter/material.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/scaffold.dart';

///модели
import 'package:chum2/src/common/models/order.dart';

///внутренние виджеты
import '../custom_tab_bar.dart';
import '../view/ongoing_view.dart';
import '../view/history_view.dart';

///экран заказов
class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            ///Таб бар который содержит вкладки "активные" и "история"
            const CustomTabBar(),

            ///вьюхи растягиваем на весь экран
            Expanded(
              child: TabBarView(
                children: [
                  OngoingView(orders: existingOrders),
                  HistoryView(orders: existingOrders),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
