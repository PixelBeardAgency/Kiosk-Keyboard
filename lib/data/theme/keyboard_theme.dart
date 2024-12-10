import 'package:flutter/widgets.dart';

class KeyboardTheme {
  // Sizes
  final EdgeInsets keyPadding;

  // Keys
  final Color backgroundColor;

  // Borders
  final double borderWidth;
  final Color borderColor;

  // Text
  final Color? textColor;
  final TextStyle? textStyle;

  const KeyboardTheme({
    required this.keyPadding,
    required this.backgroundColor,
    required this.borderWidth,
    required this.borderColor,
    required this.textColor,
    required this.textStyle,
  });
}
