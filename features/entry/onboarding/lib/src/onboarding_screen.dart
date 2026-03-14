import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:designsystem/designsystem.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<OnboardingCubit>().loadPagerItems();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextTap(int currentPage, int totalPages) {
    final cubit = context.read<OnboardingCubit>();
    if (currentPage == totalPages - 1) {
      cubit.navigateToNextScreen();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      cubit.updateCurrentPage(currentPage + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    final gapHeightXl = AppSpacing.gapHeight(SpaceToken.xl);

    return Scaffold(
      backgroundColor: context.backgroundColorTheme.backgroundPrimary,
      appBar: AppBar(
          actions:[_SkipButton(onSkip: cubit.navigateToNextScreen),],
      ),
      body: BlocListener<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state.shouldNavigate) {
            context.goNamed(AppRoutesName.loginScreenName);
          }
        },
        child: Padding(
          padding: AppSpacing.all(SpaceToken.xl),
          child: Column(
            children: [
              Expanded(
                child: OnboardingPageView(
                  controller: _pageController,
                  onPageChanged: cubit.updateCurrentPage,
                ),
              ),
              const PageIndicators(),
              gapHeightXl,
              OnboardingActionButton(onTap: _onNextTap),
              gapHeightXl,
            ],
          ),
        ),
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  final VoidCallback onSkip;
  const _SkipButton({required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return AppButton.text(
      onPressed: onSkip,
      label: AppString.actionSkip,
      role: AppButtonRole.secondary,
    );
  }
}
