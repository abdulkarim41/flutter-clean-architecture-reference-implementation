import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:splash/src/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/SplashCubit.dart';

class SplashRouter implements BaseRouter {

  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.splashScreen,
      builder: (context, state) => BlocProvider(
        create: (_) => SplashCubit(),
        child: const SplashScreen(),
      ),
    ),
  ];
}
