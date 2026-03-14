
enum ButtonSize { sm, md, lg, xl }

abstract class ButtonSizing {
  static double height(ButtonSize s) => switch (s) {
    ButtonSize.sm => 32,
    ButtonSize.md => 40,
    ButtonSize.lg => 48,
    ButtonSize.xl => 56,
  };
}
