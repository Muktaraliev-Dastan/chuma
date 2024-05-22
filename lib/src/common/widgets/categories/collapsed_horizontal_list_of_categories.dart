///фреймворк
import 'package:chum2/src/common/routes/route_names.dart';
import 'package:chum2/src/common/widgets/constants/routes.dart';
import 'package:flutter/material.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';
import 'package:go_router/go_router.dart';

///внутренние виджеты
import 'categories_item.dart';

///Данные категорий (потом убрать)
///TODO: убрать данные категорий
import 'data.dart';

///свернутый лист категорий
class CollapsedHorizontalListOfCategories extends StatelessWidget {
  const CollapsedHorizontalListOfCategories({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Column(
      children: [

        ///сами категории
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [

              ///строим правильные паддинги для виджетов категорий в зависимости
              /// от расположения (индекса в массиве) категории
              ///паддинг сверзу и снизу заданы прямо тут так как если задавать вне
              ///элемента - не будет тени сверху и снизу
              ///расстояние между виджетами категорий = 10 пикселей
              for (int i = 0; i < categories.length; i++)

              ///первый виджет категории
                if (i == 0)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 5, 15),
                    child: CategoryItem(category: categories[i]),
                  )

                ///все виджеты категорий кроме первого и последнего
                else
                  if (i < (categories.length - 1))
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 20, 5, 15),
                      child: CategoryItem(category: categories[i]),
                    )

                  ///последний виджет категории
                  else
                    if (i == (categories.length - 1))
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 20, 20, 15),
                        child: CategoryItem(category: categories[i]),
                      )
            ],

          ),
        ),


        ///надпись "Открыть все категории"
        InkWell(
          onTap: () {
            context.goNamed(RouteNames.categoriesScreen);
          },
          child: Padding(
            padding: AppSizes.marginElements,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'xem tất cả danh mục >',
                style: _theme.textTheme.headline6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
