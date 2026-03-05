import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:splash/src/splash_screen.dart';

class SplashRouter implements BaseRouter {

  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
  ];
}
