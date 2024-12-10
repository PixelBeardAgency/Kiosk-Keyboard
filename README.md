A customisable On Screen Keyboard for Kiosks

> Currently under development

## Features

- Customisable Theme
- Custom keyboard layouts can be passed in
-

## Usage

![On Screen Keyboard Example](/assets/onscreen_keyboard.png)

All that is required is a `OnScreenKeyboard` widget with a function to handle `KeyboardKey`.

A custom keyboard layout can be passed using the `layout` parameter, which takes a `KeyboardLayout` object, and allows for any combination of keys in rows.

Theme defaults to the app theme's `primary` and `onPrimary` colors, and can be override with the `theme` parameter.

Each key has an alternative, which for text keys is the value capitalized, and can be activated by passing in the `altActive` flag.

## Example

```dart
OnScreenKeyboard(
    altActive: _shiftActive,
    layout: switch (_activeLayout) {
    _ActiveLayout.englishSimple => const EnglishSimpleLayout(),
    _ActiveLayout.numPad => _numPad,
    },
    onKeyPressed: _handleKeyPressedEvent,
)

void _handleKeyPressedEvent(KeyboardKeyModel event) {
    final currentText = _controller.text;

    switch (event.type) {
      case KeyboardKeyType.backspace:
        if (_controller.text.isNotEmpty) {
          _controller.text = currentText.substring(0, currentText.length - 1);
          if (currentText.isEmpty) {
            _shiftActive = true;
          }
        }
        break;
      case KeyboardKeyType.enter:
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(_controller.text)));
        break;
      case KeyboardKeyType.space:
        if (currentText.isNotEmpty &&
            currentText[currentText.length - 1] != ' ') {
          _controller.text = '$currentText ';
        }
        break;
      case KeyboardKeyType.character:
        _controller.text =
            '$currentText${_shiftActive ? (event.data as String).toUpperCase() : event.data}';
        if (_shiftActive) {
          _shiftActive = false;
        }

        break;
      case KeyboardKeyType.shift:
        _shiftActive = !_shiftActive;
        break;
      case KeyboardKeyType.empty:
        // do nothing
        break;
    }
    setState(() {});
  }
```

## Parameters

### OnScreenKeyboard

| Parameter                        | Type           | Description                                                            |
| -------------------------------- | -------------- | ---------------------------------------------------------------------- |
| altActive                        | boolean        | Toggle to display alternate key                                        |
| Function(KeyboardKeyModel event) | Function       | Event fired on key press                                               |
| layout                           | KeyboardLayout | The active keyboard layout, defaulting to English Simple               |
| theme                            | KeyboardTheme  | Theme for the keyboard, defaulting to `primary` and `onPrimary` colors |

### KeyboardLayout

| Parameter | Type                  | Description                         |
| --------- | --------------------- | ----------------------------------- |
| rows      | Iterable<KeyboardRow> | The rows to display on the Keyboard |

### KeyboardRow

| Parameter | Type                  | Description                    |
| --------- | --------------------- | ------------------------------ |
| keys      | Iterable<KeyboardKey> | The keys to display on the row |

### KeyboardKey<T>

| Parameter | Type                 | Description                                         |
| --------- | -------------------- | --------------------------------------------------- |
| type      | KeyboardKeyType enum | The type of key to be displayed                     |
| data      | T                    | The data to be displayed in the key                 |
| altData   | T?                   | The alternate data to be displayed in the key       |
| weight    | int                  | The weight in the row that the key takes, default 1 |

| KeyboardKey          | Type     | Description                                            |
| -------------------- | -------- | ------------------------------------------------------ |
| KeyboardCharacterKey | String   | To display a character                                 |
| KeyboardIconKey      | IconData | To display an icon, such as return, space or backspace |
| KeyboardEmptyKey     | void     | To display an empty key                                |

## TODO

- [ ] Additional language support out of the box;
- [ ] Custom Key to show any widget inside the key;
- [ ] Custom optional styling per key;
- [ ] Additional styling options;
- [ ] Multi row support;
- [ ] Helper constructor to provide `onChanged` events to handle text changes internally;
- [ ] Tests;
