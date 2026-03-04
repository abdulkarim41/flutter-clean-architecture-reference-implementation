import 'package:go_router/go_router.dart';
import 'package:splash/src/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/SplashCubit.dart';

class SplashRouter {

  static const String splashPath = '/splash';

  static List<GoRoute> routes = [
    GoRoute(
      path: splashPath,
      name: 'splash',
      builder: (context, state) => BlocProvider(
        create: (_) => SplashCubit(),
        child: const SplashScreen(),
      ),
    ),
  ];
}
