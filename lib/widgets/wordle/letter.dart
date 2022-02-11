import 'package:flutter/material.dart';
import 'package:flutter_get/utils/wordle.dart';
import 'package:flutter_get/widgets/wordle/Color.dart';

class Letter extends StatelessWidget {
  Letter({this.letterPosition = null, Key? key}) : super(key: key);

  // TODO, change the color and accept it based on the 4 conditions
  final color = Colors.blueGrey;
  LetterPosition? letterPosition;
  final size = 60.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: LetterColor.color(letterPosition),
          border: Border.all(color: Colors.grey, width: 1)),
      child: Text(
        letterPosition?.letter ?? "",
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: letterPosition?.positionStatus == PositionStatus.unvalidated
                ? Colors.black
                : Colors.white),
      ),
    );
  }
}
