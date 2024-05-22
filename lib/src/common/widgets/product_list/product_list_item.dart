///фраемворк
import 'package:chum2/src/common/routes/route_names.dart';
import 'package:chum2/src/common/widgets/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///пакеты
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
///роутер

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
class ProductListItem extends StatelessWidget {
  final Product product;

  const ProductListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return InkWell(
      onTap: () {
        ///по нажатию вызываем всплывающее окно из пакета
        showMaterialModalBottomSheet(
          duration: const Duration(seconds: 1),
          ///цвет фона всплывающего окна
          // barrierColor: const Color(0xF2f4f4f4),

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
          ///стэк для отображения бейджев
          Stack(
            children: [
              ///непосредственно карточка продукта
              Container(
                ///отступы карточки от других элементов. сверху 25.
                margin: AppSizes.marginProductCard,
                padding: const EdgeInsets.only(
                    bottom: 15, left: 0, right: 15, top: 15),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: _theme.textTheme.headline3,
                          maxLines: 3,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          product.sold,
                          style: _theme.textTheme.subtitle1,
                          maxLines: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                ///цена продукта
                                text: product.price,
                                style: _theme.textTheme.headline2,
                                children: [
                                  if (product.salePrice != '') ...[
                                    const WidgetSpan(
                                      child: SizedBox(
                                        width: 5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: product.salePrice,
                                      style: _theme.textTheme.subtitle2,
                                    ),
                                    const WidgetSpan(
                                      child: SizedBox(
                                        width: 5,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            if (product.salePrice != '') const SalesBadge(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///Бейджи Moi и Dac Biet
              ///TODO: переписать логику ифов
              ///поместить логику внутрь row
              if ((product.dacBiet == true) && (product.moi == true))
                Positioned(
                  child: Row(
                    children: const [
                      CardBadge(
                        label: 'Moi',
                        isForProductInfo: false,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CardBadge(
                        label: 'Đặc biệt',
                        isForProductInfo: false,
                      ),
                    ],
                  ),
                  top: 17,
                  right: 35,
                ),
              if ((product.dacBiet == true) && (product.moi == false))
                Positioned(
                  child: Row(
                    children: const [
                      CardBadge(
                        label: 'Đặc biệt',
                        isForProductInfo: false,
                      ),
                    ],
                  ),
                  top: 17,
                  right: 35,
                ),
              if ((product.dacBiet == false) && (product.moi == true))
                Positioned(
                  child: Row(
                    children: const [
                      CardBadge(
                        label: 'Mới',
                        isForProductInfo: false,
                      ),
                    ],
                  ),
                  top: 17,
                  right: 35,
                ),
            ],
          ),

          ///Картинка продукта слева
          Positioned(
            left: 20,
            bottom: 20,
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
