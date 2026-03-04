
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/SplashCubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..checkAuth(),
      child: BlocListener<SplashCubit, SplashStatus>(
        listener: (context, state) {
          if (state == SplashStatus.authenticated) {
            FlutterToast.toast(message: 'navigate to home');
          } else if (state == SplashStatus.unauthenticated) {
            context.pushReplacement('/login');
          }
        },
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}




