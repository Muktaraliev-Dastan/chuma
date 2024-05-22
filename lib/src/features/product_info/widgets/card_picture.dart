///фреймворк
import 'package:flutter/material.dart';

///модели
import 'package:chum2/src/common/models/product.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/advanced_shadow.dart';

class CardPicture extends StatelessWidget {
  const CardPicture({Key? key, required this.product, required this.size})
      : super(key: key);

  final Product product;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ShadowForCardPicture(
      child: Image(
          image: AssetImage(product.pathToImage),

          ///картинку размещаем в квадрат,
          ///который зависит от ширины экрана
          height: size.width * 0.57,
          width: size.width * 0.57),
    );
  }
}
