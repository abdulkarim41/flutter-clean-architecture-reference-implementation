import 'package:designsystem/designsystem.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingRepository {
  List<OnboardingPagerItem> getPagerItems() => [
    OnboardingPagerItem(
      title: AppString.titleOnboardingSlider1,
      message: AppString.messageOnboardingSlider1,
      icon: AppImages.illustrationOnboardingSlider1,
    ),
    OnboardingPagerItem(
      title: AppString.titleOnboardingSlider2,
      message: AppString.messageOnboardingSlider2,
      icon: AppImages.illustrationOnboardingSlider2,
    ),
    OnboardingPagerItem(
      title: AppString.titleOnboardingSlider3,
      message: AppString.messageOnboardingSlider3,
      icon: AppImages.illustrationOnboardingSlider3,
    ),
  ];
}
