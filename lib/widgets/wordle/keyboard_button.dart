import 'package:flutter/material.dart';
import 'package:flutter_get/providers/wordle_provider.dart';
import 'package:flutter_get/utils/wordle.dart';
import 'package:flutter_get/widgets/wordle/Color.dart';
import 'package:provider/provider.dart';

class KeyboardButton extends StatelessWidget {
  KeyboardButton({this.letterPosition, this.icon, this.width = 34, Key? key})
      : super(key: key);

  LetterPosition? letterPosition;
  IconData? icon;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: LetterColor.color(letterPosition, keyboard: true)),
        margin: const EdgeInsets.all(2),
        width: width,
        height: 60,
        child: (letterPosition?.letter != null)
            ? Text(letterPosition!.letter,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))
            : Icon(
                icon,
                size: 18,
              ));
  }
}
