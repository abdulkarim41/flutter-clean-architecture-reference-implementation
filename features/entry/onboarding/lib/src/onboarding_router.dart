import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:onboarding/onboarding.dart';
import 'onboarding_screen.dart';

class OnboardingRouter implements BaseRouter {

  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesPath.onboardingScreenPath,
      name: AppRoutesName.onboardingScreenName,
      builder: (context, state) => BlocProvider(
        create: (_) => OnboardingCubit(
          prefs: GetIt.I<SharedPrefs>(),
          repository: OnboardingRepository(),
        ),
        child: const OnboardingScreen(),
      ),
    ),
  ];
}

