import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:splash/src/splash_screen.dart';

class SplashRouter implements BaseRouter {

  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesPath.splashScreenPath,
      name: AppRoutesName.splashScreenName,
      builder: (context, state) => const SplashScreen(),
    ),
  ];
}
