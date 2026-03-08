import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final AppTextColorRole colorRole;
  final AppTextWeight textWeight;
  final AppTextScale textScale;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDirection? textDirection;


  const AppText(this.text,{
    super.key,
    this.colorRole = AppTextColorRole.neutral,
    this.textWeight = const AppTextWeight.regular(),
    this.textScale = AppTextScale.bodyMedium,
    this.style,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    final typography = context.appTypography;


    final baseStyle = switch (textScale) {
      AppTextScale.titleLarge => typography.titleLarge,
      AppTextScale.titleMedium => typography.titleMedium,
      AppTextScale.titleSmall => typography.titleSmall,
      AppTextScale.bodyLarge => typography.bodyLarge,
      AppTextScale.bodyMedium => typography.bodyMedium,
      AppTextScale.bodySmall => typography.bodySmall,
      AppTextScale.bodyXSmall => typography.bodyXSmall,
    };

    return Text(
      text,
      style: baseStyle
          .getStyle(textWeight)
          .copyWith(color: _resolveTextColorRollWise(context.textColorTheme))
          .merge(style),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textDirection: textDirection,
    );
  }

  Color _resolveTextColorRollWise(TextColorThemeExtension color){
    return switch(colorRole){
      AppTextColorRole.neutral => color.neutral,
      AppTextColorRole.primary => color.primary,
      AppTextColorRole.secondary => color.secondary,
      AppTextColorRole.secondaryDark => color.secondaryDark,
      AppTextColorRole.warning => color.warning,
      AppTextColorRole.white => color.white,
      AppTextColorRole.error => color.error,
    };
  }
}
