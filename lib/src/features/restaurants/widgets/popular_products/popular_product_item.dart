///фраемворк
import 'package:flutter/material.dart';

///пакеты
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///модель
import 'package:chum2/src/common/models/product.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/sale_badge.dart';
import 'package:chum2/src/common/widgets/card_badge.dart';
import 'package:chum2/src/common/widgets/advanced_shadow.dart';

///экран детализированного вида продукта
import 'package:chum2/src/features/product_info/widgets/screens/product_info_screen.dart';

///Миникарточка каждого продукта
class PopularProductItem extends StatelessWidget {
  final Product product;

  const PopularProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).textScaleFactor);

    ThemeData _theme = Theme.of(context);

    return InkWell(
      onTap: () {
        ///по нажатию вызываем всплывающее окно из пакета
        showMaterialModalBottomSheet(
          ///цвет фона всплывающего окна
          barrierColor: const Color(0xF2f4f4f4),
          duration: const Duration(milliseconds: 1000),

          ///цвет самого всплывающего окна
          backgroundColor: Colors.transparent,
          elevation: 0,
          context: context,
          builder: (context) => ProductInfoScreen(
            // product: product,
          ),
        );
      },

      ///стэк для отображения карточки и картинки продукта слева
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            ///отступы карточки от других элементов. сверху 25.

            padding:
                const EdgeInsets.only(bottom: 15, left: 0, right: 15, top: 15),

            ///ширина карточки = ширина экрана умножить на 0.66
            width: MediaQuery.of(context).size.width * 0.7,

            decoration: ShapeDecoration(
              shape: AppSizes.shapeBorderForElements,
              color: _theme.colorScheme.surface,
              shadows: const [
                AppSizes.boxShadowForCards,
              ],
            ),
            child: Row(
              children: [
                ///пустое пространство для отображения изображения продукта
                ///выше в стек
                const SizedBox(
                  width: 110,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      ///название продукта
                      SizedBox(
                        height: 32 * MediaQuery.of(context).textScaleFactor,
                        child: Text(
                          product.title,
                          style: _theme.textTheme.headline3,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      ///цена продукта
                      Text(
                        product.price,
                        style: _theme.textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///Картинка продукта слева
          Positioned(
            left: 5,
            bottom: 10,
            child: SizedBox(
              width: 100,
              child: ShadowForIconsAndSmallImages(
                child: Image(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage(product.pathToImage),
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
