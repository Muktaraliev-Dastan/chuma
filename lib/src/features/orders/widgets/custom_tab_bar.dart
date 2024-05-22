///фреймворк
import 'package:flutter/material.dart';



///Таббар для страницы заказов
///сделан не так как в фигме
///TODO: написать свою реализацию таббара чтобы соответствовал дизайну в Фигме
class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return TabBar(
      indicatorWeight: 2,
      indicatorColor: _theme.colorScheme.primary,
      ///индикатор сайз в любом случае будет на весь таб так как для центровки
      ///используется align виджет, а он растягивается на всю площадь и центрует
      ///своего ребенка к нужному краю
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        ///центруем к левому краю
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            ///отступ сверху от аппбара, снизу до индикатора + слева 4 так как
            ///по дефолту уже задан отступ 16, а нужно 20
            padding: const EdgeInsets.only(top: 10, bottom: 5, left: 4),
            ///текст таба "активные заказы"
            child: Text(
              'Ongoing',
              style: _theme.textTheme.headline6!.copyWith(
                letterSpacing: -(14 * 0.025),
              ),
            ),
          ),
        ),
        ///центруем к правому краю
        Align(
          alignment: Alignment.centerRight,
          ///отступ сверху от аппбара, снизу до индикатора + справа 4 так как
          ///по дефолту уже задан отступ 16, а нужно 20
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5, right: 4),
            ///текст таба "история заказов"
            child: Text(
              'History',
              style: _theme.textTheme.headline6!.copyWith(
                letterSpacing: -(14 * 0.025),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
