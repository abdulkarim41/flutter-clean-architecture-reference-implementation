import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'bloc/login_cubit.dart';
import 'login_screen.dart';

class LoginRouter implements BaseRouter {

  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.loginScreen,
      builder: (context, state) => BlocProvider(
        create: (_) => LoginCubit(GetIt.I.get<PostLoginApiUsecase>()),
        child: const LoginScreen(),
      ),
    ),
  ];
}
