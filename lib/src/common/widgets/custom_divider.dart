///фреймворк
import 'package:flutter/material.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///Дивайдер который разделяет между собой некоторые элементы
///Дивайдер строит адекватное загругление углов только если ширина или высота
///не больше 3 пикселей. Иначе закругление нужно менять
class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: _theme.colorScheme.background,
        borderRadius: AppSizes.borderRadiusForDividers,
      ),
    );
  }
}
