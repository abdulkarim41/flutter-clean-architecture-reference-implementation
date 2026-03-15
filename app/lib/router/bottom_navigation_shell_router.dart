
import 'package:cart/cart.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:products/products.dart';
import 'package:profile/profile.dart';

import 'bottom_navigation_shell.dart';

class BottomNavigationShellRouter extends BaseRouter {
  @override
  List<RouteBase> get routes => [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavigationShell(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: ProductsRouter().routes,
        ),
        StatefulShellBranch(
          routes: CartRouter().routes,
        ),
        StatefulShellBranch(
          routes: ProfileRouter().routes,
        ),
      ],
    ),
  ];

}