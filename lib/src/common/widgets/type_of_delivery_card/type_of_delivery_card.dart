//
//
// ///фреймворк
// import 'package:flutter/material.dart';
//
// ///константы
// import 'package:chum2/src/common/widgets/constants/theme.dart';
//
// ///внутреннние виджеты
// import 'item_of_type_of_delivery_card.dart';
//
// ///сторонние виджеты
// import 'package:chum2/src/common/widgets/custom_divider.dart';
//
// class TypeOfDeliveryCard extends StatefulWidget {
//   const TypeOfDeliveryCard({Key? key}) : super(key: key);
//
//   @override
//   _TypeOfDeliveryCardState createState() => _TypeOfDeliveryCardState();
// }
//
// class _TypeOfDeliveryCardState extends State<TypeOfDeliveryCard> {
//   @override
//   Widget build(BuildContext context) {
//     ThemeData _theme = Theme.of(context);
//
//     return Container(
//       decoration: ShapeDecoration(
//         shape: AppSizes.shapeBorderForElements,
//         color: _theme.colorScheme.surface,
//         shadows: const [
//           AppSizes.boxShadowForCards,
//         ],
//       ),
//       padding: AppSizes.paddingTypeOfDeliveryCard,
//       margin: AppSizes.marginElements,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           GestureDetector(
//             onTap: () {
//               print('tap');
//             },
//             child: const ItemOfDeliveryCard(
//                 iconPath: 'assets/icons/type_of_delivery_card/delivery.svg',
//                 label: 'Vận chuyển'),
//           ),
//           const CustomDivider(
//             height: 60,
//             width: 2,
//           ),
//           const ItemOfDeliveryCard(
//               iconPath: 'assets/icons/type_of_delivery_card/take_away.svg',
//               label: 'Lấy đi'),
//           const CustomDivider(
//             height: 60,
//             width: 2,
//           ),
//           const ItemOfDeliveryCard(
//               iconPath: 'assets/icons/type_of_delivery_card/in_cafe.svg',
//               label: 'Trong quán'),
//         ],
//       ),
//     );
//   }
// }
//
// ///тестирование аутентификации
