import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding/src/bloc/onboarding_cubit.dart';
import 'package:onboarding/src/model/onboarding_pager_item.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  const OnboardingPageView({super.key, required this.controller, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OnboardingCubit, OnboardingState, List<OnboardingPagerItem>>(
      selector: (state) => state.pagerItems,
      builder: (context, pagerItems) {
        return PageView.builder(
          controller: controller,
          itemCount: pagerItems.length,
          onPageChanged: onPageChanged,
          itemBuilder: (_, index) => _PagerItem(item: pagerItems[index]),
        );
      },
    );
  }
}

class _PagerItem extends StatelessWidget {
  final OnboardingPagerItem item;

  const _PagerItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(item.icon, height: 300),
        AppSpacing.gapHeight(SpaceToken.xl),
        AppText(item.title, textAlign: TextAlign.center, textScale: AppTextScale.bodyLarge, textWeight: AppTextWeight.bold()),
        AppSpacing.gapHeight(SpaceToken.md),
        AppText(item.message, textAlign: TextAlign.center, textScale: AppTextScale.bodySmall, colorRole: AppTextColorRole.neutral),
      ],
    );
  }
}
