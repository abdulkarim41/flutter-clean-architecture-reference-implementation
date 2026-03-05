
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

import 'router_refresh_stream.dart';

class AppRouter {
  static GoRouter router(AuthBloc authBloc) {
    return GoRouter(
      initialLocation: AppRoutesName.splashScreen,
      refreshListenable: RouterRefreshStream(authBloc.stream),

      redirect: (context, state) {
        final authState = authBloc.state;
        final location = state.matchedLocation;

        switch (authState.status) {
          case AuthStatus.loading:
            return location == AppRoutesName.splashScreen ? null : AppRoutesName.splashScreen;

          case AuthStatus.showOnboarding:
            return location == AppRoutesName.onboardingScreen ? null : AppRoutesName.onboardingScreen;

          case AuthStatus.unauthenticated:
            return location == AppRoutesName.loginScreen ? null : AppRoutesName.loginScreen;

          case AuthStatus.authenticated:
            final isBottomTab = location.startsWith(AppRoutesName.productScreen) ||
                location.startsWith(AppRoutesName.cartScreen) ||
                location.startsWith(AppRoutesName.profileScreen);

            return isBottomTab ? null : AppRoutesName.productScreen;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

