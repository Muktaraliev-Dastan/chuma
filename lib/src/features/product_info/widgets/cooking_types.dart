///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///сторонние виджеты
import 'package:chum2/src/common/widgets/custom_divider.dart';
import 'package:chum2/src/common/widgets/advanced_shadow.dart';

///модели
import 'package:chum2/src/common/models/cooking_type.dart';

///виджет типов приготовления
class CookingTypes extends StatelessWidget {
  final List<CookingType> cookingTypes;

  const CookingTypes({Key? key, required this.cookingTypes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///расстояние до дивайдера
        const SizedBox(
          height: 30,
        ),

        ///дивайдер
        const CustomDivider(
          height: 3,
          width: double.infinity,
        ),

        ///расстояние после дивайдера
        const SizedBox(
          height: 30,
        ),

        ///лейбл блока типов приготовления продуктов
        Text(
          'Loại Chuẩn Bị',
          style: _theme.textTheme.headline4!.copyWith(
            color: Color(0xFF663908),
          ),
        ),

        ///сами типы приготовления
        ...cookingTypes
            .map(
              (cookingType) =>

                  ///внешний Row который содержит внутренний Row (с иконкой,
                  ///названием,ценой) и кнопку выбора
                  Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///внутренний Row с иконкой,названием,ценой
                    ///обернут в паддинг 10 справа чтобы дать отступ после текста
                    ///перед кнопкой
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ///картинка типа приготовления
                          SvgPicture.asset(
                            cookingType.pathToImage,
                            width: 32,
                            height: 32,
                          ),

                          ///расстояние между картинкой типа приготовления и текстом
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cookingType.name,
                                style: _theme.textTheme.headline6!
                                    .copyWith(letterSpacing: -(14 * 0.025)),
                              ),
                              Text(
                                ///используется intl пакет,
                                ///### значит брать 3 цифры (опуская нули)
                                ///, значит групповой разделитель (после 3 цифр)
                                ///000 значит 3 цифры (не опуская нули)
                                ///'vi_VN' это локаль и она дает точку между цифрами
                                '${NumberFormat('###,000', 'vi_VN').format(cookingType.price)} đ',
                                style: _theme.textTheme.headline6!
                                    .copyWith(letterSpacing: -(14 * 0.025)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    ///кнопка выбора, зависит от того выбран ли элемент или нет
                    cookingType.isSelected
                        ? SvgPicture.asset(
                            'assets/icons/product_info_screen/plus_button_big_filled2.svg',
                            width: 32,
                            height: 32,
                          )
                        : ShadowForIconsAndSmallImages(
                            child: SvgPicture.asset(
                              'assets/icons/product_info_screen/plus_button_big3.svg',
                              width: 32,
                              height: 32,
                            ),
                          ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
