import 'package:flutter/material.dart';
import 'package:kiosk_keyboard/kiosk_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  bool _shiftActive = true;
  bool _showKeyboard = true;

  _ActiveLayout _activeLayout = _ActiveLayout.englishSimple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('On Screen Keyboard Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      TextField(
                        controller: _controller,
                        onChanged: (value) => setState(() {}),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _controller.text,
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FloatingActionButton(
                          onPressed: () => setState(
                            () => _activeLayout = switch (_activeLayout) {
                              _ActiveLayout.englishSimple =>
                                _ActiveLayout.numPad,
                              _ActiveLayout.numPad =>
                                _ActiveLayout.englishSimple,
                            },
                          ),
                          tooltip: 'Change Layout',
                          child: const Icon(Icons.keyboard),
                        ),
                        const SizedBox(width: 16),
                        FloatingActionButton(
                          onPressed: () =>
                              setState(() => _showKeyboard = !_showKeyboard),
                          tooltip:
                              _showKeyboard ? 'Show Keyboard' : 'Hide Keyboard',
                          child: Icon(
                            _showKeyboard
                                ? Icons.expand_more
                                : Icons.expand_less,
                          ),
                        ),
                        const SizedBox(width: 16),
                        FloatingActionButton(
                          onPressed: () => setState(() => _controller.clear()),
                          tooltip: 'Reset',
                          child: const Icon(Icons.clear),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          if (_showKeyboard)
            OnScreenKeyboard(
              altActive: _shiftActive,
              layout: switch (_activeLayout) {
                _ActiveLayout.englishSimple => const EnglishSimpleLayout(),
                _ActiveLayout.numPad => _numPad,
              },
              onKeyPressed: _handleKeyPressedEvent,
            )
        ],
      ),
    );
  }

  void _handleKeyPressedEvent(KeyboardKey event) {
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
}

enum _ActiveLayout { englishSimple, numPad }

KeyboardLayout get _numPad => KeyboardLayout(
      rows: [
        KeyboardRow(
          keys: [
            ...[
              1,
              2,
              3,
            ].map(
              (k) => KeyboardCharacterKey(
                type: KeyboardKeyType.character,
                data: '$k',
              ),
            ),
            const KeyboardEmptyKey()
          ],
        ),
        KeyboardRow(
          keys: [
            ...[
              4,
              5,
              6,
            ].map(
              (k) => KeyboardCharacterKey(
                type: KeyboardKeyType.character,
                data: '$k',
              ),
            ),
            const KeyboardEmptyKey()
          ],
        ),
        KeyboardRow(
          keys: [
            ...[
              7,
              8,
              9,
            ].map(
              (k) => KeyboardCharacterKey(
                type: KeyboardKeyType.character,
                data: '$k',
              ),
            ),
            const KeyboardIconKey(
              type: KeyboardKeyType.backspace,
              data: Icons.keyboard_backspace,
              weight: 1,
            ),
          ],
        ),
        const KeyboardRow(
          keys: [
            KeyboardCharacterKey(
              type: KeyboardKeyType.character,
              data: '#',
            ),
            KeyboardCharacterKey(
              type: KeyboardKeyType.character,
              data: '0',
            ),
            KeyboardCharacterKey(
              type: KeyboardKeyType.character,
              data: '*',
            ),
            KeyboardIconKey(
              type: KeyboardKeyType.enter,
              data: Icons.keyboard_return,
            ),
          ],
        ),
      ],
    );
