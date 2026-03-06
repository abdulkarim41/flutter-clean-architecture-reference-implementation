import 'package:flutter/material.dart';
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
import 'bottom_navigation_shell.dart';
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

