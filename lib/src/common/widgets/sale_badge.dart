///фреймворк
import 'package:flutter/material.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

class SalesBadge extends StatelessWidget {
  const SalesBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 1.5, horizontal: 5),
      decoration: BoxDecoration(
        boxShadow: const [AppSizes.boxShadowForSale],
        color: const Color(0xFFF05322),
        borderRadius: AppSizes.borderRadiusForBadges,
      ),
      child: Text(
        'Sale',
        style: _theme.textTheme.headline5,
      ),
    );
  }
}
