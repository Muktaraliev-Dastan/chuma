///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:figma_squircle/figma_squircle.dart';


///модели
import 'package:chum2/src/common/models/restaurant.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';


///TODO: убрать зависимость от экранов
///экраны
import 'pages/restaurant_screen.dart';

///свернутая карточка заведения
class ShortRestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const ShortRestaurantCard({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SmoothRadius _smoothRadius =
        SmoothRadius(cornerSmoothing: 1, cornerRadius: 20);

    ThemeData _theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => RestaurantScreen(restaurant: restaurant,)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///отступ сверху
          const SizedBox(
            height: 20,
          ),

          ///карточка ресторана
          Row(
            children: [
              ///картинка
              Container(
                decoration: const ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius.only(
                      topLeft: _smoothRadius,
                      bottomLeft: _smoothRadius,
                    ),
                  ),
                  color: Colors.transparent,
                  shadows: [AppSizes.boxShadowForCards],
                ),
                child: ClipSmoothRect(
                  radius: const SmoothBorderRadius.only(
                    topLeft: _smoothRadius,
                    bottomLeft: _smoothRadius,
                  ),
                  child: Image.asset(
                    restaurant.pathToImage,
                    fit: BoxFit.fitHeight,
                    height: 107,
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                ),
              ),

              ///поле после картинки
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 124,
                  decoration: ShapeDecoration(
                    shape: const SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.only(
                        topRight: _smoothRadius,
                        bottomRight: _smoothRadius,
                      ),
                    ),
                    color: _theme.colorScheme.surface,
                    shadows: const [AppSizes.boxShadowForCards],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///название ресторана
                      Text(
                        restaurant.name,
                        style: _theme.textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      ///адрес
                      Text(
                        restaurant.address,
                        style: _theme.textTheme.subtitle1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),

                      ///расстояние до юзера
                      Text(
                        '1 km away from you',
                        style: _theme.textTheme.headline3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
