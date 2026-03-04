
import 'package:go_router/go_router.dart';
import 'package:login/login.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: LoginRouter.loginPath,
    routes: [
      ...LoginRouter.routes,
    ],
  );
}
