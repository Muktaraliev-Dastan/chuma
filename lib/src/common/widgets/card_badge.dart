///фреймворк
import 'package:flutter/material.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

class CardBadge extends StatelessWidget {
  final String label;
  final bool isForProductInfo;

  const CardBadge(
      {Key? key, required this.label, required this.isForProductInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Container(
      padding: isForProductInfo
          ? const EdgeInsets.symmetric(vertical: 4, horizontal: 6)
          : const EdgeInsets.symmetric(vertical: 1.5, horizontal: 5),
      decoration: BoxDecoration(
        boxShadow: const [AppSizes.boxShadowForBadges],
        color: _theme.colorScheme.primary,
        borderRadius: AppSizes.borderRadiusForBadges,
      ),
      child: Text(
        label,
        style: isForProductInfo
            ? _theme.textTheme.headline4!.copyWith(
          color: const Color(0xFFFFFFFF), letterSpacing: -0.45,)
            : _theme.textTheme.headline5,
      ),);
  }
}
