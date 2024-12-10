part of 'keyboard_layout.dart';

final class EnglishSimpleLayout extends KeyboardLayout {
  const EnglishSimpleLayout()
      : super(
          rows: const [
            KeyboardRow(
              keys: [
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: '1',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: '2',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: '3',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: '4',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: '5',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: '6',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: '7',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: '8',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: '9',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: '0',
                ),
              ],
            ),
            KeyboardRow(
              keys: [
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'q',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'w',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'e',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'r',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 't',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'y',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'u',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'i',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'o',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'p',
                ),
              ],
            ),
            KeyboardRow(
              keys: [
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'a',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 's',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'd',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'f',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'g',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'h',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'j',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'k',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'l',
                ),
                KeyboardIconKey(
                  type: KeyboardKeyType.enter,
                  data: Icons.keyboard_return,
                  weight: 2,
                ),
              ],
            ),
            KeyboardRow(
              keys: [
                KeyboardIconKey(
                  type: KeyboardKeyType.shift,
                  data: Icons.arrow_upward,
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'z',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'x',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'c',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'v',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'b',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'n',
                ),
                KeyboardCharacterKey(
                  type: KeyboardKeyType.character,
                  data: 'm',
                ),
                KeyboardIconKey(
                  type: KeyboardKeyType.backspace,
                  data: Icons.keyboard_backspace,
                  weight: 2,
                ),
              ],
            ),
            KeyboardRow(
              keys: [
                KeyboardEmptyKey(weight: 1),
                KeyboardIconKey(
                  type: KeyboardKeyType.space,
                  data: Icons.space_bar,
                  weight: 10,
                ),
                KeyboardEmptyKey(weight: 1),
              ],
            )
          ],
        );
}
