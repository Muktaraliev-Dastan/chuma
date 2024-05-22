///фреймворк
import 'package:flutter/material.dart';

///модели
import 'package:chum2/src/common/models/product.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/card_badge.dart';

class Badges extends StatelessWidget {
  const Badges({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.dacBiet == true)
          const CardBadge(
            label: 'Đặc biệt',
            isForProductInfo: true,
          ),
        if ((product.dacBiet == true) && (product.moi == true))
          const SizedBox(
            height: 10,
          ),
        if (product.moi == true)
          const CardBadge(
            label: 'Mới',
            isForProductInfo: true,
          ),
      ],
    );
  }
}
