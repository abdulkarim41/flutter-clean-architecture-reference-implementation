
import 'package:go_router/go_router.dart';
import 'package:login/login.dart';
import 'package:navigation/navigation.dart';
import 'package:shared/shared.dart';
import 'package:splash/splash.dart';
import 'package:onboarding/onboarding.dart';

import 'router_refresh_stream.dart';

class AppRouter {
  static GoRouter router(AuthBloc authBloc) {
    return GoRouter(
      initialLocation: AppRoutesName.splashScreen,

      refreshListenable: RouterRefreshStream(authBloc.stream),

      redirect: (context, state) {
        final authState = authBloc.state;

        final isSplash = state.matchedLocation == AppRoutesName.splashScreen;
        final isLogin = state.matchedLocation == AppRoutesName.loginScreen;
        final isOnboarding = state.matchedLocation == AppRoutesName.onboardingScreen;

        if(authState.status == AuthStatus.showOnboarding) {
          return isOnboarding ? null : AppRoutesName.onboardingScreen;
        }

        /// Loading → stay splash
        if (authState.status == AuthStatus.loading) {
          return isSplash ? null : AppRoutesName.splashScreen;
        }

        /// Unauthenticated → Login
        if (authState.status == AuthStatus.unauthenticated) {
          return isLogin ? null : AppRoutesName.loginScreen;
        }

        /// Authenticated → Home
        if (authState.status == AuthStatus.authenticated) {
          return "/home";
        }

        return null;
      },

      routes: [
        ...SplashRouter().routes,
        ...OnboardingRouter().routes,
        ...LoginRouter().routes,
      ],
    );
  }
}
