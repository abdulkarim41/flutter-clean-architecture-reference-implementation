part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final List<OnboardingPagerItem> pagerItems;
  final int currentPageIndex;
  final bool shouldNavigate;

  const OnboardingState({
    this.pagerItems = const [],
    this.currentPageIndex = 0,
    this.shouldNavigate = false,
  });

  OnboardingState copyWith({
    List<OnboardingPagerItem>? pagerItems,
    int? currentPageIndex,
    bool? shouldNavigate,
  }) {
    return OnboardingState(
      pagerItems: pagerItems ?? this.pagerItems,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      shouldNavigate: shouldNavigate ?? this.shouldNavigate,
    );
  }

  @override
  List<Object?> get props => [pagerItems, currentPageIndex, shouldNavigate];
}
