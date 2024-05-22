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
import 'package:chum2/src/common/widgets/advanced_shadow.dart';

///фотография ресторана с его названием и адресом и кнопкой "назад" поверх
///фотографии ресторана
class RestaurantInformationCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInformationCard({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    const SmoothRadius _smoothRadius =
        SmoothRadius(cornerSmoothing: 1, cornerRadius: 20);

    return Column(
      children: [
        ///изображение ресторана c кнопой. растягяиваем контейнер по горизонтали
        Container(
          height: 120,
          decoration: ShapeDecoration(
            image: DecorationImage(
              ///изображение ресторана делаем фоном чтобы сверху положить кнопку

              image: AssetImage(restaurant.pathToImage),
              fit: BoxFit.fitWidth,
            ),
            shape: const SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.only(
                topLeft: _smoothRadius,
                topRight: _smoothRadius,
              ),
            ),
            color: Colors.transparent,
            shadows: const [AppSizes.boxShadowForCards],
          ),

          ///подложка кнопки
          // child: Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding: const EdgeInsets.all(10),
          //     child: Container(
          //       height: 50,
          //       width: 50,
          //       decoration: ShapeDecoration(
          //         color: _theme.colorScheme.background,
          //         shape: SmoothRectangleBorder(
          //           borderRadius: SmoothBorderRadius(
          //             cornerRadius: 23,
          //             cornerSmoothing: 1,
          //           ),
          //         ),
          //       ),
          //
          //       ///сама кнопка
          //       child: Align(
          //         alignment: Alignment.center,
          //         child: InkWell(
          //           onTap: () {
          //             Navigator.pop(context);
          //           },
          //           child: ShadowForIconsAndSmallImages(
          //             child: SvgPicture.asset(
          //               'assets/icons/common/back_button.svg',
          //               width: 32,
          //               height: 32,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ),
        Container(
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.only(
                bottomRight: _smoothRadius,
                bottomLeft: _smoothRadius,
              ),
            ),
            color: _theme.colorScheme.surface,
            shadows: [AppSizes.boxShadowForCards],
          ),
          child: Padding(
            padding: AppSizes.marginElements,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ///название ресторана
                Text(
                  restaurant.name,
                  style: _theme.textTheme.headline4,
                ),
                const SizedBox(
                  height: 5,
                ),
                ///адрес
                Text(restaurant.address, style: _theme.textTheme.headline3,),
                const SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
