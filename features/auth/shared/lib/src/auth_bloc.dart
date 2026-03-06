import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final FetchProfileApiUsecase _fetchProfileApiUsecase;
  final PostLoginApiUsecase _postLoginApiUsecase;

  final SharedPrefs _sharedPrefs;

  AuthBloc({
    required FetchProfileApiUsecase fetchProfileApiUsecase,
    required PostLoginApiUsecase postLoginApiUsecase,
    required SharedPrefs sharedPrefs,
  }) : _fetchProfileApiUsecase = fetchProfileApiUsecase,
       _postLoginApiUsecase = postLoginApiUsecase,
       _sharedPrefs = sharedPrefs,
       super(const AuthState(AuthStatus.initial));

  Future<void> checkAuth() async {
    final isOnboardingLaunched = !_sharedPrefs.get<bool>(key: SpKey.isOnboardingLaunched);
    final isUserAuthenticate = _sharedPrefs.get<bool>(key: SpKey.isUserAuthenticate);

    if (isOnboardingLaunched) {
      emit(const AuthState(AuthStatus.showOnboarding));
      return;
    }

    if(isUserAuthenticate){
      fetchProfileApi();
      return;
    }
    emit(const AuthState(AuthStatus.unauthenticated));
  }

  Future<void> fetchProfileApi({bool isFromLogin = false}) async {
    if(!isFromLogin) emit(const AuthState(AuthStatus.loading));

    final result = await _fetchProfileApiUsecase.invoke();

    result.when(
      success: (_) {
        /// Navigate to home screen
        emit(const AuthState(AuthStatus.authenticated));
      },
      failure: (_) {
        /// Navigate to login screen
        emit(const AuthState(AuthStatus.unauthenticated));
      },
    );
  }

  Future<void> login(String userName, String password) async {

    emit(AuthState(state.status, isLoginLoading: true));

    final result = await _postLoginApiUsecase.invoke(
        LoginApiParams(username: userName, password: password)
    );

    result.when(
      success: (data) {
        /// Fetch Profile Api Call
        fetchProfileApi(isFromLogin: true);
      },
      failure: (error) {
        emit(const AuthState(AuthStatus.unauthenticated));
      },
    );

  }

  Future<void> logout() async {
    final isOnboardingLaunched = _sharedPrefs.get<bool>(key: SpKey.isOnboardingLaunched);

    _sharedPrefs
    ..clearAll()
    ..set(key: SpKey.isOnboardingLaunched, value: isOnboardingLaunched);

    emit(const AuthState(AuthStatus.unauthenticated));
  }

  Future<void> completeOnboarding() async {
    await _sharedPrefs.set<bool>(key: SpKey.isOnboardingLaunched,value: true);
    emit(const AuthState(AuthStatus.unauthenticated));
  }

}