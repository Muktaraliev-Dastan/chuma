///фреймворк
import 'package:flutter/material.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///модели
import 'package:chum2/src/common/models/restaurant.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/scaffold.dart';
import 'package:chum2/src/common/widgets/categories/collapsed_horizontal_list_of_categories.dart';
import 'package:chum2/src/common/widgets/product_list/product_list.dart';

///внутренние виджеты
import '../restaraunt_information_card.dart';
import '../type_of_service_information_card.dart';
import '../popular_products/popular_products.dart';

///экран опрделенного ресторана
class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return SafeArea(
      child: PopCustomScaffold(
        body: ListView(
          children: [
            ///отступ сверху
            const SizedBox(
              height: 20,
            ),

            ///картинка сверху с кнопкой "назад"
            Padding(
              padding: AppSizes.marginElements,
              child: RestaurantInformationCard(restaurant: restaurant),
            ),
            const SizedBox(
              height: 20,
            ),

            ///тип сервиса карточка
            const Padding(
              padding: AppSizes.marginElements,
              child: TypeOfServiceInformationCard(),
            ),

            ///категории, без паддинга так как паддинг забит в самих категориях
            const CollapsedHorizontalListOfCategories(),
            const SizedBox(
              height: 20,
            ),

            ///популярные продукты
            const PopularProducts(),

            ///тайтл первой категории
            Padding(
              padding: AppSizes.marginElements,
              child: Text(
                'Cà phê',
                style: _theme.textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ProductList(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: AppSizes.marginElements,
              child: Text(
                'Nước ép',
                style: _theme.textTheme.headline1,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
