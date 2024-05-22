///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_svg/flutter_svg.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///модели
import 'package:chum2/src/common/models/restaurant.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/scaffold.dart';

///внутренние виджеты
import '../short_restaurant_card.dart';

///страница всех заведений
class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    ///все помещаем в ListView в том числе и поле поиска
    return Padding(
      padding: AppSizes.marginElements,
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),

          ///строка поиска
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: ShapeDecoration(
                    shape: SmoothRectangleBorder(
                      side: const BorderSide(
                          width: 0.5, color: Color(0xFF656565)),
                      borderRadius: SmoothBorderRadius(
                          cornerRadius: 10, cornerSmoothing: 1),
                    ),
                    color: _theme.colorScheme.surface,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        'assets/icons/common/find_icon.svg',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SvgPicture.asset(
                'assets/icons/common/geo_icon.svg',
                width: 28,
                height: 35,
              )
            ],
          ),

          ///список ресторанов
          ...existingRestaurants
              .map(
                  (restaurant) => ShortRestaurantCard(restaurant: restaurant))
              .toList()
        ],
      ),
    );
  }
}

