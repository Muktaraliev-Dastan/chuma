import 'package:chum2/src/common/routes/route_names.dart';
import 'package:chum2/src/common/widgets/categories/screen/categories_screen_full.dart';
import 'package:chum2/src/common/widgets/scaffold.dart';
import 'package:chum2/src/features/home/widgets/screens/home_page.dart';
import 'package:chum2/src/features/orders/widgets/pages/orders_page.dart';
import 'package:chum2/src/features/product_info/widgets/screens/product_info_screen.dart';
import 'package:chum2/src/features/restaurants/widgets/pages/restaurants_page.dart';
import 'package:chum2/src/features/vip_card/widgets/screen/vip_card_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/homePage",
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return ScaffoldNavigationWrapper(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _sectionANavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              name: RouteNames.homePage,
              path: '/homePage',
              builder: (BuildContext context, GoRouterState state) =>
                  const HomePage(),
              routes: <RouteBase>[
                // GoRoute(
                //   path: 'productInfoScreen',
                //   builder: (BuildContext context, GoRouterState state) =>
                //       ProductInfoScreen(),
                // ),
                GoRoute(
                  name: RouteNames.categoriesScreen,
                  path: 'categoriesScreen',
                  builder: (BuildContext context, GoRouterState state) =>
                      const CategoriesScreen(),
                ),
                // GoRoute(
                //   name: RouteNames.productInfoScreen,
                //   path: 'productInfoScreen',
                //   pageBuilder: (context, state) {
                //     return CustomTransitionPage(
                //       transitionDuration: const Duration(milliseconds: 2000),
                //       reverseTransitionDuration: const Duration(milliseconds: 2000),
                //
                //       child: ProductInfoScreen(),
                //       transitionsBuilder: _modalSheetTransitionBuilder,
                //     );
                //   },
                // ),
                GoRoute(
                  name: RouteNames.productInfoScreen,
                  path: 'productInfoScreen',
                  builder: (BuildContext context, GoRouterState state) => ProductInfoScreen(),
                  pageBuilder: (context, state) {
                    return SlideTransitionPage(child: ProductInfoScreen());
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              name: RouteNames.orderPage,
              path: '/orderPage',
              builder: (BuildContext context, GoRouterState state) =>
                  const OrderPage(),
              // routes: <RouteBase>[
              //   GoRoute(
              //     path: 'details/:param',
              //     builder: (BuildContext context, GoRouterState state) =>
              //         DetailsScreen(
              //       label: 'B',
              //       param: state.pathParameters['param'],
              //     ),
              //   ),
              // ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              name: RouteNames.restaurantsPage,
              path: '/restaurantsPage',
              builder: (BuildContext context, GoRouterState state) =>
                  const RestaurantsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              name: RouteNames.vipCardPage,
              path: '/vipCardPage',
              builder: (BuildContext context, GoRouterState state) =>
                  const VipCardPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class SlideTransitionPage<T> extends CustomTransitionPage<T> {
  SlideTransitionPage({
    required Widget child,
  }) : super(
          child: child,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            // const curve = Curves.easeInOut;
            const curve = Curves.ease;

            final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            final offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

Widget _modalSheetTransitionBuilder(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
    )),
    child: child,
  );
}

Route<T> modalSheetBuilder<T>(BuildContext context, Widget child) {
  return MaterialPageRoute(
    fullscreenDialog: true, // Включает полноэкранный диалог
    builder: (context) => child,
  );
}