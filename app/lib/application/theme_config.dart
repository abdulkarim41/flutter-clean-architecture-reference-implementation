part of 'my_application.dart';

ThemeData _buildAppTheme(Brightness brightness) {
  final appTheme = (brightness == Brightness.dark) ? AppTheme.dark() : AppTheme.light();

  return ThemeData(
    brightness: brightness,
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.grey700,
    ),
    extensions: <ThemeExtension<dynamic>>[appTheme],
  );
}