///фреймворк
import 'package:flutter/material.dart';

///пакеты
import 'package:flutter_svg/flutter_svg.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///общие виджеты
import 'package:chum2/src/common/widgets/advanced_shadow.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const CustomAppBar({Key? key, required this.showBackButton})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      alignment: Alignment.center,
      padding: AppSizes.paddingAppBar,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
            width: 106.0,
            height: 14.0,
          ),

          ///если нужно показывать backButton то убираем оставшиеся элементы и
          ///показываем backButton, если нет то показываем оставшиеся элементы

          if (showBackButton == true) ...[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ///кнопка назад
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ShadowForIconsAndSmallImages(
                    child: SvgPicture.asset(
                      'assets/icons/common/back_button.svg',
                      height: 32,
                      width: 32,

                    ),
                  ),
                ),
                ///отступ 5 пикселей до конца аппбара
                const SizedBox(height: 5,)
              ],
            ),
          ] else ...[
            ///лайк иконка
            SvgPicture.asset(
              'assets/icons/app_bar/like.svg',
              width: 18,
              height: 16.0,
            ),
            Row(
              children: [
                ///иконка локации
                SvgPicture.asset(
                  'assets/icons/app_bar/location.svg',
                  width: 8,
                  height: 10,
                ),
                const SizedBox(width: 8.0),
                Text(
                  'Thái Nguyên',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(width: 4.0),
                SvgPicture.asset(
                  'assets/icons/app_bar/arrow_down.svg',
                  width: 8,
                  height: 10,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
