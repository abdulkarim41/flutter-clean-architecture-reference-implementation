import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/onboarding.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final SharedPrefs _prefs;
  final OnboardingRepository _repository;

  OnboardingCubit({
    required SharedPrefs prefs,
    required OnboardingRepository repository,
  }) : _prefs = prefs,
        _repository = repository,
       super(const OnboardingState());

  void loadPagerItems() {
    emit(state.copyWith(pagerItems: _repository.getPagerItems()));
  }

  void updateCurrentPage(int pageIndex) {
    emit(state.copyWith(currentPageIndex: pageIndex));
  }

  void goToNextPage() {
    if (state.currentPageIndex == state.pagerItems.length - 1) {
      navigateToNextScreen();
    } else {
      updateCurrentPage(state.currentPageIndex + 1);
    }
  }

  void navigateToNextScreen() {
    _prefs.set<bool>(key: SpKey.isOnboardingLaunched, value: true);
    emit(state.copyWith(shouldNavigate: true));
  }
}
