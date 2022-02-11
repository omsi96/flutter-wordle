import 'package:flutter/material.dart';
import 'package:flutter_get/providers/wordle_provider.dart';
import 'package:flutter_get/widgets/wordle/keyboard_button.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
          children: row1Keys.map((text) => LetterButton(text: text)).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row2Keys.map((text) => LetterButton(text: text)).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                final provider =
                    Provider.of<WordleProvider>(context, listen: false);
                final message = await provider.submitAttempt();
                if (message.isNotEmpty) {
                  Get.snackbar("Error", message);
                }
              },
              child: KeyboardButton(
                  icon: Icons.subdirectory_arrow_left_rounded, width: 50),
            ),
            ...row3Keys
                .map((text) => LetterButton(
                      text: text,
                    ))
                .toList(),
            InkWell(
                onTap: () {
                  Provider.of<WordleProvider>(context, listen: false).erase();
                },
                child:
                    KeyboardButton(icon: Icons.backspace_outlined, width: 50)),
          ],
        ),
      ],
    );
  }
}

class LetterButton extends StatelessWidget {
  LetterButton({
    required this.text,
    Key? key,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("HELLO");
        Provider.of<WordleProvider>(context, listen: false).typeLetter(text);
      },
      child: KeyboardButton(
        text: text,
      ),
    );
  }
}
