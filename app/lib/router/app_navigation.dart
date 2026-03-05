import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:login/login.dart';
import 'package:navigation/navigation.dart';
import 'package:product_details/product_details.dart';
import 'package:shared/shared.dart';
import 'package:splash/splash.dart';
import 'package:onboarding/onboarding.dart';
import 'package:products/products.dart';
import 'package:cart/cart.dart';
import 'package:profile/profile.dart';
import 'router_refresh_stream.dart';

class AppRouter {
  static GoRouter router(AuthBloc authBloc) {
    return GoRouter(
      initialLocation: AppRoutesPath.splashScreenPath,
      refreshListenable: RouterRefreshStream(authBloc.stream),

      debugLogDiagnostics: true,
      observers: [AppNavigationObserver()],

      redirect: (context, state) {
        final authState = authBloc.state;
        final location = state.matchedLocation;

        switch (authState.status) {
          case AuthStatus.loading:
            return location == AppRoutesPath.splashScreenPath ? null : AppRoutesPath.splashScreenPath;

          case AuthStatus.showOnboarding:
            return location == AppRoutesPath.onboardingScreenPath ? null : AppRoutesPath.onboardingScreenPath;

          case AuthStatus.unauthenticated:
            return location == AppRoutesPath.loginScreenPath ? null : AppRoutesPath.loginScreenPath;

          case AuthStatus.authenticated:
            final isBottomTab = location.startsWith(AppRoutesPath.productScreenPath) ||
                location.startsWith(AppRoutesPath.cartScreenPath) ||
                location.startsWith(AppRoutesPath.profileScreenPath);

            return isBottomTab ? null : AppRoutesPath.productScreenPath;

          default:
            return null;
        }
      },

      routes: [
        ...SplashRouter().routes,
        ...OnboardingRouter().routes,
        ...LoginRouter().routes,

        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BottomNavigationShell(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(routes: ProductsRouter().routes),
            StatefulShellBranch(routes: CartRouter().routes),
            StatefulShellBranch(routes: ProfileRouter().routes),
          ],
        ),
        ...ProductDetailsRouter().routes
      ],
    );
  }
}

class BottomNavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationShell({
    super.key,
    required this.navigationShell,
  });

  void _onTabChange(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  Future<void> _showExitDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Are you sure you want to exit?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () => dialogContext.pop(),
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () => SystemNavigator.pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;

        if (context.canPop()) {
          context.pop();
        } else if (navigationShell.currentIndex != 0) {
          navigationShell.goBranch(0);
        } else {
          _showExitDialog(context);
        }
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _onTabChange,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              selectedIcon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}


class AppNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('ROUTER LOG [PUSH]: ${route.settings.name ?? 'Unnamed Route'} | Previous: ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('ROUTER LOG [POP]: ${route.settings.name ?? 'Unnamed Route'} | Previous: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('ROUTER LOG [REPLACE]: ${newRoute?.settings.name ?? 'Unnamed Route'} | Old: ${oldRoute?.settings.name}');
  }
}

