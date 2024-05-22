///фреймворк
import 'package:flutter/material.dart';

///пакеты
import 'package:flutter_svg/flutter_svg.dart';

///константы
import 'package:chum2/src/common/widgets/constants/routes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int menuIndex;
  final void Function(int) setActiveIndex;

  const CustomBottomNavigationBar(
      {Key? key, required this.menuIndex, required this.setActiveIndex})
      : super(key: key);

  Widget iconByIndex(String icon, String iconFlooded, int index) {
    return Column(
      children: [
        SvgPicture.asset(
          index == menuIndex ? iconFlooded : icon,
          height: 24.0,
          width: 24.0,
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }

  BottomNavigationBarItem getItem(String icon, String iconFlooded, String label,
      int index) {
    return BottomNavigationBarItem(
      icon: iconByIndex(icon, iconFlooded, index),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO: вынести куда-нибудь где не пересоздается, например initstate (преобразоваться в stfl)

    List<BottomNavigationBarItem> menuItems = [
      getItem('assets/icons/bottom_menu/home.svg',
          'assets/icons/bottom_menu/home_flooded.svg', 'Trang chủ', 0),
      getItem('assets/icons/bottom_menu/orders.svg',
          'assets/icons/bottom_menu/orders_flooded.svg', 'Đặt hàng', 1),
      getItem('assets/icons/bottom_menu/shops.svg',
          'assets/icons/bottom_menu/shops_flooded.svg', 'Cửa hàng', 2),
      getItem('assets/icons/bottom_menu/vip.svg',
          'assets/icons/bottom_menu/vip_flooded.svg', 'Ưu dãi', 3),
      getItem('assets/icons/bottom_menu/menu.svg',
          'assets/icons/bottom_menu/menu_flooded.svg', 'Khác', 4),
    ];

    return SizedBox(
      height: 70,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: menuIndex,
        onTap: setActiveIndex,
        items: menuItems,
      ),
    );
  }
}
