import 'package:designsystem/designsystem.dart';

final class ButtonColorSet{

  final ButtonColor? filled;
  final ButtonColor? outline;
  final ButtonColor? textAndIconOnly;
  final ButtonColor? filledWithOutline;

  const ButtonColorSet({
    this.filled,
    this.outline,
    this.textAndIconOnly,
    this.filledWithOutline,
  });
}