///фреймворк
import 'package:flutter/material.dart';

///модели
import 'package:chum2/src/common/models/product.dart';

///внутренние виджеты
import 'product_list_item.dart';

///список неоткрытых карточек продуктов который используется на главной странице
class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          products.map((product) => ProductListItem(product: product)).toList(),
    );
  }
}
