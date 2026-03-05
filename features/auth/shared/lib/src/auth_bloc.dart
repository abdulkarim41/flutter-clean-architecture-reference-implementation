import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final FetchProfileApiUsecase _fetchProfileApiUsecase;
  final SharedPrefs _sharedPrefs;

  AuthBloc({
    required FetchProfileApiUsecase fetchProfileApiUsecase,
    required SharedPrefs sharedPrefs,
  }) : _fetchProfileApiUsecase = fetchProfileApiUsecase,
       _sharedPrefs = sharedPrefs,
       super(const AuthState(AuthStatus.initial));

  Future<void> checkAuth() async {
    if (state.status == AuthStatus.loading) return;

    emit(const AuthState(AuthStatus.loading));

    final isOnboardingLaunched = !_sharedPrefs.get<bool>(key: SpKey.isOnboardingLaunched);

    if(isOnboardingLaunched){
      emit(const AuthState(AuthStatus.showOnboarding));
      return;
    }

    final result = await _fetchProfileApiUsecase.invoke();

    result.when(
      success: (_) {
        /// navigate to home screen
        emit(const AuthState(AuthStatus.authenticated));
      },
      failure: (_) {
        /// navigate to login screen
        emit(const AuthState(AuthStatus.unauthenticated));
      },
    );
  }

  Future<void> completeOnboarding() async {
    await _sharedPrefs.set<bool>(key: SpKey.isOnboardingLaunched,value: true);
    emit(const AuthState(AuthStatus.unauthenticated));
  }

}