import 'package:navigation/navigation.dart';
import 'package:splash/splash.dart';
import 'package:login/login.dart';
import 'package:onboarding/onboarding.dart';
import 'package:product_details/product_details.dart';

import 'bottom_navigation_shell_router.dart';


List<BaseRouter> get routers => [
  SplashRouter(),
  OnboardingRouter(),
  LoginRouter(),
  BottomNavigationShellRouter(),
  ProductDetailsRouter(),
];



