import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kiosk_keyboard/data/keyboard_key.dart';
import 'package:kiosk_keyboard/data/theme/keyboard_theme.dart';

final class KeyboardKeyView<T> extends StatefulWidget {
  final KeyboardKey<T> keyboardKey;
  final bool altActive;
  final Function() onKeyPressed;
  final KeyboardTheme theme;

  const KeyboardKeyView(
    this.keyboardKey, {
    super.key,
    required this.altActive,
    required this.onKeyPressed,
    required this.theme,
  });

  @override
  State<KeyboardKeyView<T>> createState() => _KeyboardKeyViewState<T>();
}

class _KeyboardKeyViewState<T> extends State<KeyboardKeyView<T>> {
  Timer? _keyDownTimer;
  Timer? _keyRepeatTimer;

  @override
  void dispose() {
    _cancelTimers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.keyboardKey.weight,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.theme.borderColor,
            width: widget.theme.borderWidth,
          ),
        ),
        child: Material(
          color: widget.theme.backgroundColor,
          child: InkWell(
            onTapDown: (_) {
              widget.onKeyPressed();
              _keyDownTimer = Timer(
                const Duration(milliseconds: 500),
                () {
                  _keyRepeatTimer = Timer.periodic(
                    const Duration(milliseconds: 50),
                    (_) => widget.onKeyPressed(),
                  );
                },
              );
            },
            onTapUp: (details) => _cancelTimers(),
            onTapCancel: () => _cancelTimers(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 24.0,
                ),
                child: switch (widget.keyboardKey) {
                  KeyboardCharacterKey(
                    data: final char,
                    altData: final altChar
                  ) =>
                    Text(
                      widget.altActive ? altChar ?? char.toUpperCase() : char,
                      style: widget.theme.textStyle,
                    ),
                  KeyboardIconKey(data: final icon, altData: final altIcon) =>
                    Icon(
                      widget.altActive && altIcon != null ? altIcon : icon,
                      color: widget.theme.textColor,
                    ),
                  KeyboardEmptyKey() => const SizedBox.shrink(),
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _cancelTimers() {
    _keyDownTimer?.cancel();
    _keyDownTimer = null;
    _keyRepeatTimer?.cancel();
    _keyRepeatTimer = null;
  }
}
