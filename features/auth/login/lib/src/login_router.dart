import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'login_screen.dart';

class LoginRouter implements BaseRouter {

  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesPath.loginScreenPath,
      builder: (context, state) =>  const LoginScreen()
    ),
  ];
}
