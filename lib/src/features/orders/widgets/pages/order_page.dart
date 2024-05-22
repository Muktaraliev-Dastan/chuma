///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///модели
import 'package:chum2/src/common/models/order.dart';
import 'package:chum2/src/common/models/type_of_service.dart';
import 'package:chum2/src/common/models/user.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/scaffold.dart';
import 'package:chum2/src/common/widgets/type_of_delivery_card/type_of_service_card.dart';
import 'package:chum2/src/common/widgets/advanced_shadow.dart';
import 'package:chum2/src/common/widgets/custom_divider.dart';

class OrderPage extends StatelessWidget {
  final Order order;

  const OrderPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _textForOrderStatus(order) {
      if (order.orderStatus == OrderStatus.selection)
        return 'Lựa chọn sản phẩm';
      if (order.orderStatus == OrderStatus.processing) return 'Xử lý đơn hàng';
      return 'Đơn hàng đã được xử lý';
    }

    String _textForTypeOfService(order) {
      if (order.typeOfService == TypeOfService.delivery) return 'Vận chuyển';
      if (order.typeOfService == TypeOfService.takeAway) return 'Lấy đi';
      return 'Trong quán';
    }

    ThemeData _theme = Theme.of(context);

    return SafeArea(
      child: PopCustomScaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),

            ///полотно заказа
            Container(
              margin: AppSizes.marginElements,
              decoration: ShapeDecoration(
                  shape: const SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius.only(
                      topLeft:
                          SmoothRadius(cornerSmoothing: 1, cornerRadius: 20),
                      topRight:
                          SmoothRadius(cornerSmoothing: 1, cornerRadius: 20),
                    ),
                  ),
                  color: _theme.colorScheme.surface,
                  shadows: const [AppSizes.boxShadowForCards]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TypeOfServiceCard(),
                  Padding(
                    padding: AppSizes.marginElements,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),

                        ///тип сервиса
                        Text(
                          _textForTypeOfService(order),
                          style: _theme.textTheme.headline4!.copyWith(
                            color: const Color(0xFF656565),
                            letterSpacing: -(18 * 0.025),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        ///имя и адрес пользователя
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///имя и адрес
                            Text(
                              '${user.name} - ${user.phoneNumber}',
                              style: _theme.textTheme.headline3,
                            ),

                            ///кнопка "вперед"
                            ShadowForIconsAndSmallImages(
                              child: SvgPicture.asset(
                                'assets/icons/common/right_arrow_common.svg',
                                height: 16,
                                width: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomDivider(height: 2, width: double.infinity),
                        const SizedBox(
                          height: 20,
                        ),

                        ///адрес, потом переделать
                        ///TODO: если тип - доставка то адрес юзера
                        ///если тип - в ресторане или с собой то адрес кафе
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ///иконка геолокации
                                  SvgPicture.asset(
                                    'assets/icons/common/geo_icon.svg',
                                    width: 20,
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),

                                  ///адрес
                                  Expanded(
                                    child: Text(
                                      user.userAddresses[0].addressFromMap,
                                      maxLines: 2,
                                      style: _theme.textTheme.headline3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                            ),

                            ///кнопка "вперед"
                            ShadowForIconsAndSmallImages(
                              child: SvgPicture.asset(
                                'assets/icons/common/right_arrow_common.svg',
                                height: 16,
                                width: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomDivider(height: 2, width: double.infinity),
                        const SizedBox(
                          height: 20,
                        ),

                        ///Время сервиса
                        ///TODO: доделать логику
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ///иконка времени
                                  SvgPicture.asset(
                                    'assets/icons/common/time.svg',
                                    width: 20,
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),

                                  ///время
                                  Expanded(
                                    child: Text(
                                      order.timeOfService,
                                      maxLines: 2,
                                      style: _theme.textTheme.headline3,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              ),
                            ),

                            ///кнопка "вперед"
                            ShadowForIconsAndSmallImages(
                              child: SvgPicture.asset(
                                'assets/icons/common/right_arrow_common.svg',
                                height: 16,
                                width: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomDivider(height: 2, width: double.infinity),
                        const SizedBox(
                          height: 20,
                        ),

                        ///Статус заказа
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/common/order_status.svg',
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              _textForOrderStatus(order),
                              style: _theme.textTheme.headline3!.copyWith(
                                  color: Color(0xFFA4101B),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomDivider(height: 2, width: double.infinity),
                        const SizedBox(
                          height: 20,
                        ),

                        ///название ресторана где заказ
                        Text(
                          order.shop.name,
                          style: _theme.textTheme.headline4,
                        ),

                        ///список заказанных продуктов
                        ...order.products
                            .map(
                              (product) => Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 0),

                                ///общая строка
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ///расширенная строка так как в ней есть динамически
                                    ///подстраиваемый элемент - название
                                    Expanded(
                                      ///внутренняя строка
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ///изображение продукта
                                          ShadowForIconsAndSmallImages(
                                            child: Image.asset(
                                              product.pathToImage,
                                              width: 48,
                                              height: 48,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),

                                          ///расширенная так как надо подстраивать текст
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ///название продукта
                                                ///TODO: доделать количество
                                                Text(
                                                  '1 x ${product.title}',
                                                  style: _theme
                                                      .textTheme.headline6,
                                                ),
                                                if (product
                                                    .cookingTypes.isNotEmpty)

                                                  ///тип приготовления
                                                  Text(
                                                    product.cookingTypes
                                                        .firstWhere((cookingType) =>
                                                            (cookingType
                                                                    .isSelected ==
                                                                true))
                                                        .name,
                                                    style: _theme
                                                        .textTheme.headline6!
                                                        .copyWith(
                                                      color: _theme.colorScheme
                                                          .secondary,
                                                    ),
                                                  ),

                                                ///дополнительные продукты
                                                ...product.additionalProducts
                                                    .where(
                                                        (additionalProduct) =>
                                                            (additionalProduct
                                                                    .quantity >
                                                                0))
                                                    .map(
                                                      (additionalProduct) =>
                                                          Text(
                                                        '+ ${additionalProduct.title}',
                                                        style: _theme.textTheme
                                                            .headline6!
                                                            .copyWith(
                                                          color: _theme
                                                              .colorScheme
                                                              .secondary,
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 10,
                                    ),

                                    ///правая часть - тотал за продукт и количество с кнопками
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        ///тотал цена
                                        Text(
                                          product.price,
                                          style: _theme.textTheme.headline3,
                                        ),
                                        const SizedBox(
                                          height: 13,
                                        ),

                                        ///кнопки количества заказов
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ShadowForIconsAndSmallImages(
                                              child: SvgPicture.asset(
                                                'assets/icons/common/minus_button_small.svg',
                                                width: 22,
                                                height: 22,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                              child: Center(
                                                child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/common/plus_button_small.svg',
                                              width: 22,
                                              height: 22,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomDivider(height: 2, width: double.infinity),
                        const SizedBox(
                          height: 20,
                        ),

                        ///тотал
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                'Total',
                                style: _theme.textTheme.headline4,
                              ),
                            ),
                            Text(
                              '${NumberFormat('###,000', 'vi_VN').format(order.total)} đ',
                              style: _theme.textTheme.headline3,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
