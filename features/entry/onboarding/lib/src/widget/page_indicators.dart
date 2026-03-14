import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/src/bloc/onboarding_cubit.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    final surfaceColors = context.backgroundColorTheme;

    return BlocSelector<OnboardingCubit, OnboardingState, ({int current, int total})>(
      selector: (state) => (current: state.currentPageIndex, total: state.pagerItems.length),
      builder: (_, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(state.total, (index) {
            final isActive = state.current == index;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: AppSpacing.horizontal(SpaceToken.xs),
              width: isActive ? 44 : 4,
              height: 4,
              decoration: AppRadii.boxDecoration(radius: RadiusToken.sm, color: isActive ? surfaceColors.backgroundPrimary : surfaceColors.backgroundSecondary),
            );
          }),
        );
      },
    );
  }
}
