import 'package:flutter/material.dart';

class KeyboardTheme {
  // Sizes
  final EdgeInsets keyPadding;

  // Keys
  final Color? backgroundColor;

  // Borders
  final double borderWidth;
  final Color borderColor;

  // Text
  final Color textColor;
  final TextStyle? textStyle;

  KeyboardTheme(
    BuildContext context, {
    EdgeInsets? keyPadding,
    Color? backgroundColor,
    double? borderWidth,
    Color? borderColor,
    Color? textColor,
    TextStyle? textStyle,
  })  : keyPadding = keyPadding ??
            const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 24.0,
            ),
        backgroundColor =
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        borderWidth = borderWidth ?? 0.2,
        borderColor = borderColor ?? Theme.of(context).colorScheme.onPrimary,
        textColor = textColor ?? Theme.of(context).colorScheme.onPrimary,
        textStyle = textStyle ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                );
}
