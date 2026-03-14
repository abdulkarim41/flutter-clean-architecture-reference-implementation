import 'package:designsystem/designsystem.dart';

sealed class ButtonColorRole {
  const ButtonColorRole();

  const factory ButtonColorRole.brand() = ButtonColorBrand._;
  const factory ButtonColorRole.secondary() = ButtonColorSecondary._;
  const factory ButtonColorRole.custom(ButtonColor color) = ButtonColorCustom._;
}

final class ButtonColorBrand implements ButtonColorRole {
  const ButtonColorBrand._();
}

final class ButtonColorSecondary implements ButtonColorRole {
  const ButtonColorSecondary._();
}

final class ButtonColorCustom implements ButtonColorRole {
  final ButtonColor color;
  const ButtonColorCustom._(this.color);
}
