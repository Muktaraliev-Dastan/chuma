import 'package:flutter/material.dart';

///сторонние виджеты
import 'package:chum2/src/common/widgets/app_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

///скаффолд который используется в страницах вызываемых с помощью команды push
class PopCustomScaffold extends StatelessWidget {
  final int bottomMenuIndex;
  final Widget body;

  const PopCustomScaffold({
    Key? key,
    this.bottomMenuIndex = 0,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CustomAppBar(
        showBackButton: true,
      ),
      body: body,
    );
  }
}

class ScaffoldNavigationWrapper extends StatelessWidget {
  const ScaffoldNavigationWrapper({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  Widget iconByIndex(String icon, String iconFlooded, int index) {
    return Column(
      children: [
        SvgPicture.asset(
          index==navigationShell.currentIndex?iconFlooded:icon,
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

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        items: menuItems,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
