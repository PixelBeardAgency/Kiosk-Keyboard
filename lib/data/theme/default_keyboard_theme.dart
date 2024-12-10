import 'package:flutter/material.dart';
import 'package:kiosk_keyboard/data/theme/keyboard_theme.dart';

class DefaultKeyboardTheme extends KeyboardTheme {
  DefaultKeyboardTheme.fromContext(BuildContext context)
      : super(
          backgroundColor: Theme.of(context).colorScheme.primary,
          borderColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
          borderWidth: 0.2,
          keyPadding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 24.0,
          ),
          textColor: Theme.of(context).colorScheme.onPrimary,
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        );
}
