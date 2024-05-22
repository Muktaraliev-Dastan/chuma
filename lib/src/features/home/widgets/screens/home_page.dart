///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:flutter_bloc/flutter_bloc.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/scaffold.dart';
import 'package:chum2/src/common/widgets/type_of_delivery_card/type_of_service_card.dart';
import 'package:chum2/src/common/widgets/categories/collapsed_horizontal_list_of_categories.dart';
import 'package:chum2/src/common/widgets/product_list/product_list.dart';

///внутренние виджеты
import '../carousel_with_promo.dart';

///блок
import '../../bloc/home_products.dart';

///домашний экран приложения
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return BlocBuilder<HomeProductBloc, HomeProductState>(
      builder: (context, state) {
        if (state is HomeProductsLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeProductsLoadSuccess) {
          return ListView(
            children: [
              ///отступ сверху
              const SizedBox(height: 20),

              // ///промоблок в виде карусели
              CarouselWithSales(),

              ///отступ до карточки доставки
              const SizedBox(height: 20),

              ///карточка доставка-с собой-в кафе
              Padding(
                  padding: AppSizes.marginElements,
                  child: const TypeOfServiceCard()),

              const CollapsedHorizontalListOfCategories(),

              ///отступ
              const SizedBox(height: 20),

              ///лист с популярными продуктами, сортировка по количеству sold
              const ProductList(),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
