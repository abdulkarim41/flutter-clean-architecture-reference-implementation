
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashStatus> {
  SplashCubit() : super(SplashStatus.initial);

  Future<void> checkAuth() async {
    emit(SplashStatus.loading);

    await Future.delayed(const Duration(seconds: 2));

    final bool hasToken = false;

    if (hasToken) {
      emit(SplashStatus.authenticated);
    } else {
      emit(SplashStatus.unauthenticated);
    }
  }
}

enum SplashStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
}