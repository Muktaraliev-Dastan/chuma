///фреймворк
import 'package:flutter/material.dart';
import 'dart:math';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///модели
import 'package:chum2/src/common/models/product_characteristic.dart';

///отображает таблицу характеристик продукта
class CharacteristicsTable extends StatelessWidget {
  ///мапка с характеристиками продукта
  final List<ProductCharacteristic> characteristics;

  const CharacteristicsTable({Key? key, required this.characteristics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Column(
      children: [
        ///расстояние до таблицы характеристик = 30, но так как у нее верхний
        ///отступ = 5 то высота SizedBox = 30-5=25
        const SizedBox(
          height: 25,
        ),
        Table(

            /// ширину подстраиваем под наибольшую ячейку таблицы
            defaultColumnWidth: const IntrinsicColumnWidth(),

            /// вертикальное расположение элементов в таблице
            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // textBaseline: TextBaseline.alphabetic,
            children: characteristics
                .map(
                  (characteristic) => TableRow(
                    children: [
                      ///название характеристики
                      Padding(
                        ///отступы между элементами задаем с помощью этого паддинга
                        ///справа - 15, так как еще +5 у самого квадратика итого 20
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 0, right: 15),
                        child: Text(
                          characteristic.name,
                          style: _theme.textTheme.headline6!
                              .copyWith(letterSpacing: -(14 * 0.025)),
                        ),
                      ),

                      /// квадратики от 1 до 10, обозначающие характеристику продукта
                      Row(
                        children: [
                          for (int i = 0; i < min(10, characteristic.amount); i++)

                            ///отступ снизу чтобы выровнять квадратики характеристик
                            ///согласно тексту
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Container(
                                ///отступ слева = расстояние между квадратиками
                                ///Так же это часть расстояния (5 из 20) до характеристики
                                margin: const EdgeInsets.only(left: 5),
                                width: 10,
                                height: 10,
                                decoration: ShapeDecoration(
                                  color: _theme.colorScheme.primary,
                                  shape:
                                      AppSizes.shapeBorderForCharacteristicsTable,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                )
                .toList()),
      ],
    );
  }
}
