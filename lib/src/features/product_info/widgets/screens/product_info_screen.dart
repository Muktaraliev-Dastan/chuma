///фреймворк
import 'dart:developer';


import 'package:chum2/src/common/routes/route_names.dart';
import 'package:chum2/src/common/widgets/constants/routes.dart';
import 'package:flutter/material.dart';

///модели
import 'package:chum2/src/common/models/product.dart';
import 'package:go_router/go_router.dart';

///внутренние виджеты
import '../card_picture.dart';
import '../badges.dart';
import '../right_arrow_icon.dart';
import '../left_arrow_icon.dart';
import '../bottom_buttons.dart';
import '../close_icon.dart';
import '../detailed_product_card.dart';

///страница открывающегося окна
///Scaffold не нужен так как используется пакет в который уже вшит Scaffold(не
///уверен)

// class ProductInfoScreen extends StatefulWidget {
//   final Product product;
//
//   const ProductInfoScreen({Key? key, required this.product}) : super(key: key);

class ProductInfoScreen extends StatefulWidget {
  ProductInfoScreen({Key? key}) : super(key: key);
  final product = products[0];

  @override
  _ProductInfoScreen createState() => _ProductInfoScreen();
}

class _ProductInfoScreen extends State<ProductInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),

                ///Стэк для картинки продукта, бейджов и карточки продукта
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ///карточка продукта, без картинки и бейджев
                    DetailedProductCard(
                      product: widget.product,
                      size: constraints.biggest,
                    ),

                    ///Картинка продукта
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: CardPicture(
                          product: widget.product,
                          size: constraints.biggest,
                        ),
                      ),
                    ),

                    ///Бейдж продукта слева от картинки
                    if ((widget.product.dacBiet == true) ||
                        (widget.product.moi == true))
                      Positioned(
                        top: 70,
                        left: 40,
                        child: Badges(product: widget.product),
                      ),

                    ///Кнопка перемотки изображения справа
                    Positioned(
                      ///высота сверху = высота картинки (которая равна ширине
                      ///экрана * 0.57) минус высота иконки
                      top: constraints.biggest.width * 0.57 - 28,
                      right: 40,
                      child: const RightArrowIcon(),
                    ),

                    ///Кнопка перемотки изображения слева
                    Positioned(
                      ///высота сверху = высота картинки (которая равна ширине
                      ///экрана * 0.57) минус высота иконки
                      top: constraints.biggest.width * 0.57 - 28,
                      left: 40,
                      child: const LeftArrowIcon(),
                    ),

                    ///Кнопка закрытия страницы справа
                    Positioned(
                      top: 70,
                      right: 40,
                      child: InkWell(
                        child: const CloseIcon(),
                        onTap: () {
                          context.pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),

            ///нижняя кнопка заказа продукта
            Positioned(
              bottom: 0,
              child: BottomButtons(
                size: constraints.biggest,
              ),
            )
          ],
        ),
      ),
    );
  }
}


