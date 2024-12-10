import 'package:flutter/material.dart';
import 'package:kiosk_keyboard/data/keyboard_key.dart';
import 'package:kiosk_keyboard/data/layout/keyboard_layout.dart';
import 'package:kiosk_keyboard/data/theme/default_keyboard_theme.dart';
import 'package:kiosk_keyboard/data/theme/keyboard_theme.dart';
import 'package:kiosk_keyboard/presentation/keyboard_key_view.dart';

class OnScreenKeyboard extends StatelessWidget {
  final bool altActive;
  final Function(KeyboardKey event) onKeyPressed;
  final KeyboardLayout layout;
  final KeyboardTheme? theme;

  const OnScreenKeyboard({
    super.key,
    required this.onKeyPressed,
    this.altActive = true,
    this.layout = const EnglishSimpleLayout(),
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...layout.rows.map(
          (row) => IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...row.keys.map(
                  (keyboardKey) => KeyboardKeyView(
                    keyboardKey,
                    altActive: altActive,
                    onKeyPressed: () => onKeyPressed(keyboardKey),
                    theme: theme ?? DefaultKeyboardTheme.fromContext(context),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
