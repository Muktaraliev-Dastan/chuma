///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_svg/flutter_svg.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///модели
import 'package:chum2/src/common/models/user.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/scaffold.dart';
import 'package:chum2/src/common/widgets/advanced_shadow.dart';

///экран с вип картой и системой скидок пользователя
class VipCardPage extends StatelessWidget {
  const VipCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    ThemeData _theme = Theme.of(context);

    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),

        ///лейбл
        Padding(
          padding: AppSizes.marginElements,
          child: Text(
            'Tích điểm',
            style: _theme.textTheme.headline4,
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        ///полотно с картой и слайд-индикатором потраченного
        Padding(
          padding: AppSizes.marginElements,
          child: Container(
            decoration: ShapeDecoration(
                shape: const SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.only(
                    topLeft: SmoothRadius(cornerSmoothing: 1, cornerRadius: 20),
                    topRight:
                        SmoothRadius(cornerSmoothing: 1, cornerRadius: 20),
                  ),
                ),
                color: _theme.colorScheme.surface,
                shadows: const [AppSizes.boxShadowForCards]),
            child: Column(
              children: [
                ///карточка с потраченной суммой и ID сверху через стэк
                Stack(
                  children: [
                    ///изображени карточки
                    Container(
                      decoration: ShapeDecoration(
                          shape: AppSizes.shapeBorderForElements,
                          color: _theme.colorScheme.surface,
                          shadows: const [AppSizes.boxShadowForCards]),
                      child: Image.asset(
                        'assets/vip_cards/bronze.png',
                        width: _size.width - 40,
                        fit: BoxFit.fitWidth,
                      ),
                    ),

                    ///ID пользователя
                    Positioned(
                      top: ((71 * (_size.width - 40)) / (374 / 207)) / 207,
                      child: SizedBox(
                        width: _size.width - 40,
                        child: Center(
                          child: Text(
                            user.id.toString(),
                            style: _theme.textTheme.headline4!.copyWith(
                              color: const Color(0xFF656565),
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///потраченное бабло
                    Positioned(
                      top: ((23 * (_size.width - 40)) / (374 / 207)) / 207,
                      right: ((23 * (_size.width - 40)) / (374 / 207)) / 207,
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/vip_cards/indicator.svg'),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            user.moneySpend,
                            style: _theme.textTheme.headline2,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),

                ///лейблы над индикатором
                Padding(
                  padding: AppSizes.marginElements,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mới',
                        style: _theme.textTheme.headline6!
                            .copyWith(color: const Color(0xFF656565)),
                      ),
                      Text(
                        'Đồng',
                        style: _theme.textTheme.headline6!
                            .copyWith(color: const Color(0xFF656565)),
                      ),
                    ],
                  ),
                ),

                ///индикатор потраченного (полоска и слайдер перемещения)
                Padding(
                  padding: AppSizes.marginElements,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),

                          ///полоска под индикатором
                          Container(
                            height: 5,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _theme.colorScheme.secondary,
                              borderRadius: AppSizes.borderRadiusForIndicator,
                            ),
                          ),
                          const SizedBox(
                            height: 33,
                          ),
                        ],
                      ),

                      ///индикатор потраченного
                      Positioned(
                        top: 11.5,

                        ///расположение - ширина экрана минус отступы минус ширина индикатора
                        left: ((_size.width - 80 - 22) / 100) * 30,
                        child: SvgPicture.asset(
                            'assets/vip_cards/indicator_2.svg'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: AppSizes.marginElements,
                  child: Text(
                    'Còn 2 tr dong nữa bạn sẽ thăng hạng. Đổi quà không ảnh hưởng tới việc thăng hạng của bạn Chưa tích điểm',
                    style: _theme.textTheme.headline3,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),

        ///тайтл вип-карточной программы
        Padding(
          padding: AppSizes.marginElements,
          child: Text(
            'Thăng hạng dễ dàng Quyền lợi đa dạng & hấp dẫn',
            style: _theme.textTheme.headline4,
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        ///карточки которые есть и подписи к ним
        Padding(
          padding: AppSizes.marginElements,
          child: Column(
            children: [
              ///изображения карточек c подписями
              ///TODO: зарефакторить в 3 одинаковых виджета
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: (_size.width - 80) / 3,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/vip_cards/first_small.png',
                          width: (_size.width - 80) / 3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Mới (0 - 2 tr vnd)',
                          style: _theme.textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: (_size.width - 80) / 3,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/vip_cards/second_small.png',
                          width: (_size.width - 80) / 3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Bạc (2 - 5 tr vnd)',
                          style: _theme.textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: (_size.width - 80) / 3,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/vip_cards/third_small.png',
                          width: (_size.width - 80) / 3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Vàng (> 5 tr)',
                          style: _theme.textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
