
import 'package:go_router/go_router.dart';
import 'package:login/login.dart';
import 'package:navigation/navigation.dart';
import 'package:splash/splash.dart';
import 'package:onboarding/onboarding.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutesName.splashScreen,
    routes: [
      ...SplashRouter().routes,
      ...OnboardingRouter().routes,
      ...LoginRouter().routes,
    ],
  );
}
