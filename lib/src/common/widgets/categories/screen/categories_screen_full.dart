///фреймворк
import 'package:flutter/material.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///модели
import 'package:chum2/src/common/models/category.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/scaffold.dart';

///внутренние виджеты
import '../categories_item.dart';

///данные
///TODO: удалить после связи с серваком
import '../data.dart';

///экран всех категорий
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return SafeArea(
      child: PopCustomScaffold(
        ///общий отступ слева и справа
        body: Padding(
          padding: AppSizes.marginElements,
          child: ListView(
            children: [
              ///отступ от аппбара
              const SizedBox(
                height: 10,
              ),

              ///лейбл категории Ca Phe
              Text(
                'Ca Phe',
                style: _theme.textTheme.headline1,
              ),
              const SizedBox(
                height: 20,
              ),

              ///Категории Ca Phe
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.start,
                children: categories
                    .where((category) => (category.type == CategoryType.cafe))
                    .map((category) => CategoryItem(category: category))
                    .toList(),
              ),
              const SizedBox(
                height: 30,
              ),

              ///лейбл категории Restaraunts
              Text(
                'Restaurants',
                style: _theme.textTheme.headline1,
              ),
              const SizedBox(
                height: 20,
              ),

              ///Категории Restaurants
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.start,
                children: categories
                    .where((category) =>
                        (category.type == CategoryType.restaurant))
                    .map((category) => CategoryItem(category: category))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
