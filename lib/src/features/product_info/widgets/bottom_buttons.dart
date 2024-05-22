///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:flutter_svg/flutter_svg.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///внешние виджеты
import 'package:chum2/src/common/widgets/advanced_shadow.dart';

///нижние кнопки открытой карточки продукта с заказом продукта
///и количеством
class BottomButtons extends StatelessWidget {
  final Size size;

  const BottomButtons({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return SizedBox(
      width: size.width,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ///изогнутая форма сверху
              SvgPicture.asset('assets/shapes/bottom_button_shape_part1.svg'),

              ///продолжение формы, в ней кнопки
              Container(
                width: size.width,
                height: 60,
                color: _theme.colorScheme.background,
                child: Row(
                  children: [
                    ///кнопка "перейти к заказу", левая
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26, vertical: 11),
                      decoration: ShapeDecoration(
                        shape: AppSizes.shapeBorderForButtonsWithSide,
                        color: _theme.colorScheme.surface,
                        shadows: const [
                          AppSizes.boxShadowForButtons,
                        ],
                      ),
                      child: Text(
                        'Mua ngay',
                        style: _theme.textTheme.headline6!
                            .copyWith(letterSpacing: -0.35),
                      ),
                    ),

                    ///расстояние между кнопками

                    ///вторая кнопка "добавить в корзину"
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        decoration: ShapeDecoration(
                          shape: AppSizes.shapeBorderForButtons,
                          color: _theme.colorScheme.primary,
                        ),
                        child: Text(
                          'Chọn 9.999.000 đ',
                          textAlign: TextAlign.center,
                          style: _theme.textTheme.headline6!.copyWith(
                              letterSpacing: -0.35,
                              color: _theme.colorScheme.surface),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          ///верхние кнопки и количество
          ///через стак чтобы тень нормально отображалась
          ///+так как необходимо наложение на SVG-картинку
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              children: [
                ///кнопка минус
                ShadowForIconsAndSmallImages(
                  child: SvgPicture.asset(
                    'assets/icons/product_info_screen/minus_button_big3.svg',
                    height: 32,
                    width: 32,
                  ),
                ),

                ///отступ
                const SizedBox(
                  width: 10,
                ),

                ///количество продуктов
                SizedBox(
                  width: 30,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '1',
                      style: _theme.textTheme.headline1!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),

                ///отступ
                const SizedBox(
                  width: 10,
                ),

                ///кнопка плюс (задать логику если 0 то плюс белый и с тенью)
                SvgPicture.asset(
                  'assets/icons/product_info_screen/plus_button_big_filled2.svg',
                  height: 32,
                  width: 32,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
