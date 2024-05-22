///фреймворк

import 'package:flutter/material.dart';

///либы
import 'package:figma_squircle/figma_squircle.dart';
import 'package:intl/intl.dart';

///модели
import 'package:chum2/src/common/models/type_of_service.dart';
import 'package:chum2/src/common/models/order.dart';
import 'package:chum2/src/common/models/user.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///TODO: убрать зависимость от экранов
///экраны
import 'pages/order_page.dart';

///свернутая карточка заказа
class ShortOrderCard extends StatelessWidget {
  final Order order;

  const ShortOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SmoothRadius _smoothRadius =
        SmoothRadius(cornerSmoothing: 1, cornerRadius: 20);

    ThemeData _theme = Theme.of(context);

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

    const double _sizeOfCard = 160;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => OrderPage(order: order)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///отступ перед статусом заказа
          const SizedBox(
            height: 20,
          ),

          ///статус заказа снаружи карточки
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ///сам статус
                Text(
                  _textForOrderStatus(order),
                  style: _theme.textTheme.headline6!.copyWith(
                    color: const Color(0xFFA4101B),
                    letterSpacing: -(14 * 0.025),
                  ),
                ),

                ///отступ до начала строки справа
                const SizedBox(
                  width: 35,
                ),
              ],
            ),
          ),

          ///карточка заказа
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Row(
              children: [
                ///картинка
                Container(
                  decoration: const ShapeDecoration(
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.only(
                        topLeft: _smoothRadius,
                        bottomLeft: _smoothRadius,
                      ),
                    ),
                    color: Colors.transparent,
                    shadows: [AppSizes.boxShadowForCards],
                  ),
                  child: ClipSmoothRect(
                    radius: const SmoothBorderRadius.only(
                      topLeft: _smoothRadius,
                      bottomLeft: _smoothRadius,
                    ),
                    child: Image.asset(
                      order.shop.pathToImage,
                      fit: BoxFit.fitHeight,
                      height: _sizeOfCard,
                      width: MediaQuery.of(context).size.width * 0.32,
                    ),
                  ),
                ),

                ///поле после картинки
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: _sizeOfCard,
                    decoration: ShapeDecoration(
                      shape: const SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius.only(
                          topRight: _smoothRadius,
                          bottomRight: _smoothRadius,
                        ),
                      ),
                      color: _theme.colorScheme.surface,
                      shadows: [AppSizes.boxShadowForCards],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///тип сервиса
                        Text(
                          _textForTypeOfService(order),
                          style: _theme.textTheme.headline3!.copyWith(
                              color: const Color(0xFF656565),
                              letterSpacing: -(14 * 0.025)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),

                        ///время
                        Text(
                          order.timeOfService,
                          style: _theme.textTheme.headline2!.copyWith(),
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        ///если тип сервиса доставка то показываем имя и телефон юзера
                        ///и адрес доставки
                        if (order.typeOfService == TypeOfService.delivery) ...[
                          ///имя юзера
                          Text(
                            '${user.name} - ${user.phoneNumber}',
                            style: _theme.textTheme.headline3!.copyWith(),
                          ),
                          const SizedBox(
                            height: 4,
                          ),

                          ///адрес доставки
                          Text(
                            user.userAddresses[0].addressFromMap,
                            style: _theme.textTheme.subtitle1!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],

                        ///если тип сервиса take Away или в ресторане то показываем
                        ///название ресторана и адрес ресторана
                        if ((order.typeOfService == TypeOfService.takeAway) ||
                            (order.typeOfService ==
                                TypeOfService.inRestaurant)) ...[
                          ///название ресторана
                          Text(
                            order.shop.name,
                            style: _theme.textTheme.headline3!.copyWith(

                                // fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),

                          ///адрес доставки
                          Text(
                            order.shop.address,
                            style: _theme.textTheme.subtitle1,
                            maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        const SizedBox(
                          height: 8,
                        ),

                        ///Total и цена
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: _theme.textTheme.headline2!
                                  .copyWith(),
                            ),
                            Text(
                              '${NumberFormat('###,000', 'vi_VN').format(order.total)} đ',
                              style: _theme.textTheme.headline2!
                                  .copyWith(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ///фреймворк
// import 'package:chum2/common/models/type_of_service.dart';
// import 'package:flutter/material.dart';
//
// ///либы
// import 'package:figma_squircle/figma_squircle.dart';
// import 'package:intl/intl.dart';
//
// ///модели
// import 'package:chum2/common/models/order.dart';
// import 'package:chum2/common/models/user.dart';
//
// ///константы
// import 'package:chum2/common/widgetы/constants/theme.dart';
//
// ///TODO: убрать зависимость от экранов
// ///экраны
// import 'pages/order_page.dart';
//
// ///свернутая карточка заказа
// class ShortOrderCard extends StatelessWidget {
//   final Order order;
//
//   const ShortOrderCard({Key? key, required this.order}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     const SmoothRadius _smoothRadius =
//     SmoothRadius(cornerSmoothing: 1, cornerRadius: 20);
//
//     ThemeData _theme = Theme.of(context);
//
//     String _textForOrderStatus(order) {
//       if (order.orderStatus == OrderStatus.selection)
//         return 'Lựa chọn sản phẩm';
//       if (order.orderStatus == OrderStatus.processing) return 'Xử lý đơn hàng';
//       return 'Đơn hàng đã được xử lý';
//     }
//
//     String _textForTypeOfService(order) {
//       if (order.typeOfService == TypeOfService.delivery) return 'Vận chuyển';
//       if (order.typeOfService == TypeOfService.takeAway) return 'Lấy đi';
//       return 'Trong quán';
//     }
//
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           PageRouteBuilder(pageBuilder: (_, __, ___) => OrderScreen(order: order)),
//         );
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ///отступ перед статусом заказа
//           const SizedBox(
//             height: 20,
//           ),
//
//           ///статус заказа снаружи карточки
//           Align(
//             alignment: Alignment.centerRight,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ///сам статус
//                 Text(
//                   _textForOrderStatus(order),
//                   style: _theme.textTheme.headline6!.copyWith(
//                     color: const Color(0xFFA4101B),
//                     letterSpacing: -(14 * 0.025),
//                   ),
//                 ),
//
//                 ///отступ до начала строки справа
//                 const SizedBox(
//                   width: 35,
//                 ),
//               ],
//             ),
//           ),
//
//           ///карточка заказа
//           Padding(
//             padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
//             child: Row(
//               children: [
//                 ///картинка
//                 Container(
//                   decoration: const ShapeDecoration(
//                     shape: SmoothRectangleBorder(
//                       borderRadius: SmoothBorderRadius.only(
//                         topLeft: _smoothRadius,
//                         bottomLeft: _smoothRadius,
//                       ),
//                     ),
//                     color: Colors.transparent,
//                     shadows: [AppSizes.boxShadowForCards],
//                   ),
//                   child: ClipSmoothRect(
//                     radius: const SmoothBorderRadius.only(
//                       topLeft: _smoothRadius,
//                       bottomLeft: _smoothRadius,
//                     ),
//                     child: Image.asset(
//                       order.shop.pathToImage,
//                       fit: BoxFit.fitHeight,
//                       height: 160,
//                       width: MediaQuery.of(context).size.width * 0.38,
//                     ),
//                   ),
//                 ),
//
//                 ///поле после картинки
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(15),
//                     height: 160,
//                     decoration: ShapeDecoration(
//                       shape: const SmoothRectangleBorder(
//                         borderRadius: SmoothBorderRadius.only(
//                           topRight: _smoothRadius,
//                           bottomRight: _smoothRadius,
//                         ),
//                       ),
//                       color: _theme.colorScheme.surface,
//                       shadows: [AppSizes.boxShadowForCards],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ///тип сервиса
//                         Text(
//                           _textForTypeOfService(order),
//                           style: _theme.textTheme.headline6!.copyWith(
//                               color: const Color(0xFF656565),
//                               letterSpacing: -(14 * 0.025)),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//
//                         ///время
//                         Text(
//                           order.timeOfService,
//                           style: _theme.textTheme.bodyText2!.copyWith(
//                             letterSpacing: -(12 * 0.025),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//
//                         ///если тип сервиса доставка то показываем имя и телефон юзера
//                         ///и адрес доставки
//                         if (order.typeOfService == TypeOfService.delivery) ...[
//                           ///имя юзера
//                           Text(
//                             '${user.name} - ${user.phoneNumber}',
//                             style: _theme.textTheme.bodyText2!.copyWith(
//                               letterSpacing: -(12 * 0.025),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//
//                           ///адрес доставки
//                           Text(
//                             user.userAddresses[0].addressFromMap,
//                             style: _theme.textTheme.bodyText2!.copyWith(
//                               letterSpacing: -(12 * 0.025),
//                             ),
//                             maxLines: 2,
//                           ),
//                         ],
//
//                         ///если тип сервиса take Away или в ресторане то показываем
//                         ///название ресторана и адрес ресторана
//                         if ((order.typeOfService == TypeOfService.takeAway) ||
//                             (order.typeOfService ==
//                                 TypeOfService.inRestaurant)) ...[
//                           ///название ресторана
//                           Text(
//                             order.shop.name,
//                             style: _theme.textTheme.bodyText2!.copyWith(
//                               letterSpacing: -(12 * 0.025),
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//
//                           ///адрес доставки
//                           Text(
//                             order.shop.address,
//                             style: _theme.textTheme.bodyText2!.copyWith(
//                               letterSpacing: -(12 * 0.025),
//                             ),
//                             maxLines: 3,
//                           ),
//                         ],
//                         const SizedBox(
//                           height: 12,
//                         ),
//
//                         ///Total и цена
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Total',
//                               style: _theme.textTheme.headline6!
//                                   .copyWith(letterSpacing: -(14 * 0.025)),
//                             ),
//                             Text(
//                               '${NumberFormat('###,000', 'vi_VN').format(order.total)} đ',
//                               style: _theme.textTheme.headline6!
//                                   .copyWith(letterSpacing: -(14 * 0.025)),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
