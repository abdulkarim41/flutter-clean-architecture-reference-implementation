import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final FetchProfileApiUsecase fetchProfile;

  AuthBloc({
    required this.fetchProfile,
  }) : super(const AuthState(AuthStatus.initial));

  Future<void> checkAuth() async {
    if (state.status == AuthStatus.loading) return;

    emit(const AuthState(AuthStatus.loading));

    final result = await fetchProfile.invoke();

    result.when(
      success: (_) {
        Logcat.log('checkAuth success that means authenticated');
        emit(const AuthState(AuthStatus.authenticated));
      },
      failure: (_) {
        Logcat.log('checkAuth failure that means unauthenticated');
        emit(const AuthState(AuthStatus.unauthenticated));
      },
    );
  }
}