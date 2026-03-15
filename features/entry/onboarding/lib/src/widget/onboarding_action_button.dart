import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/src/bloc/onboarding_cubit.dart';

class OnboardingActionButton extends StatelessWidget {
  final void Function(int current, int total) onTap;

  const OnboardingActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnboardingCubit, OnboardingState, ({int currentPageIndex, int totalItemCount})>(
      selector: (state) => (currentPageIndex: state.currentPageIndex, totalItemCount: state.pagerItems.length),
      builder: (context, state) {
        final isLastPage = state.currentPageIndex == state.totalItemCount - 1;

        return AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(sizeFactor: animation, axis: Axis.horizontal, child: child),
              );
            },
            child: isLastPage ?
            _GetStartedButton(key: const ValueKey('start_btn'),
                onPressed: () => onTap(state.currentPageIndex, state.totalItemCount))
                : _NextIconButton(key: const ValueKey('next_btn'),
                onPressed: () => onTap(state.currentPageIndex, state.totalItemCount)),
          ),
        );
      },
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _GetStartedButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppButton.filled(
      onPressed: onPressed,
      colorRole: ButtonColorRole.brand(),
      width: double.maxFinite,
      child: AppText(AppString.actionGetStarted, colorRole: AppTextColorRole.white),
    );
  }
}

class _NextIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _NextIconButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppButton.filled(
      onPressed: onPressed,
      colorRole: ButtonColorRole.brand(),
      padding: AppSpacing.horizontal(SpaceToken.xl),
      child: AppText(AppString.actionNext, colorRole: AppTextColorRole.white),
    );
  }
}
