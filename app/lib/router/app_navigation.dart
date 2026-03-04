
import 'package:go_router/go_router.dart';
import 'package:login/login.dart';
import 'package:splash/splash.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: SplashRouter.splashPath,
    routes: [
      ...SplashRouter.routes,
      ...LoginRouter.routes,
    ],
  );
}
