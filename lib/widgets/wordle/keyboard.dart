import 'package:flutter/material.dart';
import 'package:flutter_get/widgets/wordle/keyboard_button.dart';

class Keyboard extends StatelessWidget {
  Keyboard({Key? key}) : super(key: key);

  final row1Keys = "QWERTYUIOP".split("");
  final row2Keys = "ASDFGHJKL".split("");
  final row3Keys = "ZXCVBNM".split("");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row1Keys
              .map((key) => KeyboardButton(
                    text: key,
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row2Keys
              .map((key) => KeyboardButton(
                    text: key,
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KeyboardButton(
                icon: Icons.subdirectory_arrow_left_rounded, width: 50),
            ...row3Keys
                .map((key) => KeyboardButton(
                      text: key,
                    ))
                .toList(),
            KeyboardButton(icon: Icons.backspace_outlined, width: 50),
          ],
        ),
      ],
    );
  }
}
