import 'package:flutter/material.dart';
import 'package:kiosk_keyboard/data/keyboard_key_type.dart';

sealed class KeyboardKey<T> {
  final KeyboardKeyType type;
  final T data;
  final T? altData;
  final int weight;

  const KeyboardKey({
    required this.type,
    required this.data,
    this.altData,
    this.weight = 1,
  });
}

final class KeyboardCharacterKey extends KeyboardKey<String> {
  const KeyboardCharacterKey(
      {required super.type, required super.data, super.altData, super.weight})
      : super();
}

final class KeyboardIconKey extends KeyboardKey<IconData> {
  const KeyboardIconKey({
    required super.type,
    required super.data,
    super.altData,
    super.weight,
  });
}

final class KeyboardEmptyKey extends KeyboardKey<void> {
  const KeyboardEmptyKey({super.weight})
      : super(type: KeyboardKeyType.empty, data: null);
}
