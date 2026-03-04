import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'onboarding_screen.dart';

class OnboardingRouter implements BaseRouter {

  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: AppRoutesName.onboardingScreen,
      builder: (context, state) => const OnboardingScreen(),
    ),
  ];
}
