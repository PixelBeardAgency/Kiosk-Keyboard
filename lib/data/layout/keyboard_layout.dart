library keyboard_layout;

import 'package:flutter/material.dart';
import 'package:kiosk_keyboard/data/keyboard_key.dart';
import 'package:kiosk_keyboard/data/keyboard_key_type.dart';

part 'english_layout.dart';

class KeyboardLayout {
  const KeyboardLayout({this.rows = const []});

  final Iterable<KeyboardRow> rows;
}

final class KeyboardRow {
  const KeyboardRow({required this.keys});

  final Iterable<KeyboardKey> keys;
}
