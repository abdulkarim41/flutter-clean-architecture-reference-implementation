
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';
import 'package:domain/domain.dart';

class LoginCubit extends Cubit<LoginState> {
  final PostLoginApiUsecase _postLoginApiUsecase;

  LoginCubit(
      PostLoginApiUsecase postLoginApiUsecase,
      ) : _postLoginApiUsecase = postLoginApiUsecase ,
        super(const LoginState());

  Future<void> login(LoginApiParams params) async {
    emit(state.copyWith(isLoading: true));

    final result = await _postLoginApiUsecase.invoke(params);

    result.when(
      success: (data) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.message));
      },
    );
  }
}