///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:flutter_svg/flutter_svg.dart';

///модели
import 'package:chum2/src/common/models/product.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///сторонние виджеты
import 'package:chum2/src/common/widgets/sale_badge.dart';

///внутренние виджеты
import 'characteristics_table.dart';
import 'cooking_types.dart';
import 'additional_products.dart';


///карточка продукта в открытом состоянии, без картинки и бейджев
class DetailedProductCard extends StatelessWidget {
  const DetailedProductCard(
      {Key? key, required this.product, required this.size})
      : super(key: key);

  final Product product;
  final Size size;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Container(
      ///ограничения в минимальную длину которые задаются чтобы
      ///карточка строила "поле" до низа экрана
      ///80 это на сколько вылазит картинка сверху над карточкой+отступ сверху'
      constraints: BoxConstraints(minHeight: size.height - 80),

      ///отступ от верхнего края картинки до начала карточки
      margin: AppSizes.marginProductInfoCard,
      padding: AppSizes.marginElements,

      decoration: ShapeDecoration(
        color: _theme.colorScheme.surface,
        shape: AppSizes.shapeBorderForElements,
        shadows: const [
          AppSizes.boxShadowForCards,
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Все элементы размещаются сюда
          ///SizedBox который рисует пустое расстояние (чтобы картинка продукта
          ///вставилась, сама картинка в другом виджете)
          const SizedBox(
            width: double.infinity,
            height: 228,
          ),

          ///название и кнопка лайка
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ///название продукта
              Text(
                product.title,

                ///копия Headline 1 c letterSpacing -2.5%
                style: _theme.textTheme.headline1!
                    .copyWith(letterSpacing: -(24 * 0.025)),
              ),

              ///кнопка лайка
              SvgPicture.asset(
                product.isLiked
                    ? 'assets/icons/common/like_filled.svg'
                    : 'assets/icons/common/like.svg',
                width: 14,
                height: 16,
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),

          ///цена продукта c зачеркнутой старой ценой и sale иконкой
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  ///цена продукта
                  text: product.price,
                  style: _theme.textTheme.headline1,
                  children: [
                    ///если есть старая цена - отображаем ее зачеркнрутой
                    if (product.salePrice != '') ...[
                      const WidgetSpan(
                        child: SizedBox(
                          width: 15,
                        ),
                      ),

                      ///зачеркнутая цена
                      TextSpan(
                        text: product.salePrice,
                        style: _theme.textTheme.subtitle2,
                      ),

                      ///расстояние до бейджа Sale
                      const WidgetSpan(
                        child: SizedBox(
                          width: 8,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              ///если есть старая цена - отображаем бейдж Sale
              if (product.salePrice != '') const SalesBadge(),
            ],
          ),

          const SizedBox(
            height: 20,
          ),

          ///описание продукта
          Text(
            product.description,
            style: _theme.textTheme.bodyText1!.copyWith(height: 1.3),
          ),

          ///характеристики продукта
          if (product.characteristics.isNotEmpty)
            CharacteristicsTable(characteristics: product.characteristics),

          ///типы приготовления продукта c отступами и дивайдером
          if (product.cookingTypes.isNotEmpty)
            CookingTypes(
              cookingTypes: product.cookingTypes,
            ),
          ///дополнительные продукты c отступами и дивайдером
          if (product.additionalProducts.isNotEmpty)
            AdditionalProducts(
              additionalProducts: product.additionalProducts,
            ),
          ///отступ до нижних кнопок, 122(высота кнопок) + 20(сам отступ)
          const SizedBox(height: 142,)
        ],
      ),
    );
  }
}
