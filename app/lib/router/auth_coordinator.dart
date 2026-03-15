import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:shared/shared.dart';

class AuthCoordinator extends StatelessWidget {
  final Widget child;

  const AuthCoordinator({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        switch (state.status) {

          case AuthStatus.showOnboarding:
            context.go(AppRoutesPath.onboardingScreenPath);
            break;

          case AuthStatus.unauthenticated:
            context.go(AppRoutesPath.loginScreenPath);
            break;

          case AuthStatus.authenticated:
            context.go(AppRoutesPath.productScreenPath);
            break;

          default:
            break;
        }
      },
      child: child,
    );
  }
}