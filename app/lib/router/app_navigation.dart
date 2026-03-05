
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/login.dart';
import 'package:navigation/navigation.dart';
import 'package:shared/shared.dart';
import 'package:splash/splash.dart';
import 'package:onboarding/onboarding.dart';
import 'package:products/products.dart';
import 'package:cart/cart.dart';

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

          // case AuthStatus.authenticated:
          //   return location == AppRoutesName.homeScreen ? null : AppRoutesName.homeScreen;
          case AuthStatus.authenticated:
            final isBottomTab = [
              AppRoutesName.homeScreen,
              AppRoutesName.cartScreen,
              AppRoutesName.profileScreen,
            ].contains(location);

            return isBottomTab ? null : AppRoutesName.homeScreen;

          default:
            return null;
        }
      },

      routes: [
        ...SplashRouter().routes,
        ...OnboardingRouter().routes,
        ...LoginRouter().routes,

        ShellRoute(
          builder: (context, state, child) => BottomNavigationShell(child: child),
          routes: bottomTabRoutes(),
        ),
      ],
    );
  }
}

class BottomNavigationShell extends StatelessWidget {
  final Widget child;

  const BottomNavigationShell({super.key, required this.child});

  static const tabs = [
    AppRoutesName.homeScreen,
    AppRoutesName.cartScreen,
    AppRoutesName.profileScreen,
  ];

  int _locationToTabIndex(String location) {
    if (location.startsWith(AppRoutesName.cartScreen)) return 1;
    if (location.startsWith(AppRoutesName.profileScreen)) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    final currentIndex = _locationToTabIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return;

          context.go(tabs[index]);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}


List<GoRoute> bottomTabRoutes() => [
  ...ProductsRouter().routes,
  ...CartRouter().routes,

  GoRoute(
    path: AppRoutesName.profileScreen,
    pageBuilder: (context, state) => const MaterialPage(child: ProfileScreen()),
  ),
];

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
