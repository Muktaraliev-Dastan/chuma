///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_svg/flutter_svg.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///модели
import 'package:chum2/src/common/models/restaurant.dart';
import 'package:chum2/src/common/models/user.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/advanced_shadow.dart';
import 'package:chum2/src/common/widgets/type_of_delivery_card/type_of_service_card.dart';
import 'package:chum2/src/common/widgets/custom_divider.dart';

class TypeOfServiceInformationCard extends StatelessWidget {
  const TypeOfServiceInformationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Container(

      decoration: ShapeDecoration(
          shape: const SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.only(
              topLeft: SmoothRadius(cornerSmoothing: 1, cornerRadius: 20),
              topRight: SmoothRadius(cornerSmoothing: 1, cornerRadius: 20),
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
                  'Lấy đi',
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
                             'Hôm Nay ... 15.30',
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

              ],
            ),
          )
        ],
      ),
    );
  }
}
