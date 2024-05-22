///фреймворк
import 'package:flutter/material.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///модели
import 'package:chum2/src/common/models/product.dart';

///внутренние виджеты
import 'popular_product_item.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ThemeData _theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Text('Sản phẩm phổ biến', style: _theme.textTheme.headline1,),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ///строим правильные паддинги для продуктовых карточек в зависимости
              /// от расположения (индекса в массиве) категории
              ///паддинг сверзу и снизу заданы прямо тут так как если задавать вне
              ///элемента - не будет тени сверху и снизу
              ///расстояние между виджетами категорий = 10 пикселей
              for (int i = 0; i < products.length; i++)

                ///первый виджет категории
                if (i == 0)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 5, 20),
                    child: PopularProductItem(
                      product: products[i],
                    ),
                  )

                ///все виджеты категорий кроме первого и последнего
                else if (i < (products.length - 1))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 30, 5, 20),
                    child: PopularProductItem(
                      product: products[i],
                    ),
                  )

                ///последний виджет категории
                else if (i == (products.length - 1))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 30, 20, 20),
                    child: PopularProductItem(
                      product: products[i],
                    ),
                  ),

            ],
          ),
        ),
      ],
    );
  }
}
