import 'package:flutter/material.dart';
import 'package:flutter_get/utils/wordle.dart';

class Letter extends StatelessWidget {
  Letter({this.letterPosition = null, Key? key}) : super(key: key);

  // TODO, change the color and accept it based on the 4 conditions
  final color = Colors.blueGrey;
  LetterPosition? letterPosition;
  final size = 60.0;

  Color letterColor() {
    if (letterPosition == null) return Colors.grey.shade100;
    switch (letterPosition!.positionStatus) {
      case PositionStatus.unvalidated:
        return Colors.grey.shade100;
      case PositionStatus.correct:
        return const Color(0xFF538D4E);
      case PositionStatus.misPositioned:
        return const Color(0xFFB49F3A);
      case PositionStatus.notFound:
        return const Color(0xFF3A3A3C);
    }
    // return Colors.blueGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: letterColor(),
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
