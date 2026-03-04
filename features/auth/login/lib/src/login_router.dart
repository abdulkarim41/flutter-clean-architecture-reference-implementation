import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'bloc/login_cubit.dart';
import 'login_screen.dart';

class LoginRouter {

  static const String loginPath = '/login';

  static List<GoRoute> routes = [
    GoRoute(
      path: loginPath,
      name: 'login',
      builder: (context, state) => BlocProvider(
        create: (_) => LoginCubit(
          GetIt.I.get<PostLoginApiUsecase>(),
        ),
        child: const LoginScreen(),
      ),
    ),
  ];
}
