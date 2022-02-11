import 'package:flutter/material.dart';
import 'package:flutter_get/utils/wordle.dart';

abstract class LetterColor {
  static Color color(LetterPosition? letterPosition, {keyboard = false}) {
    if (letterPosition == null) return const Color(0xff818384);
    switch (letterPosition.positionStatus) {
      case PositionStatus.unvalidated:
        return keyboard ? const Color(0xff818384) : Colors.grey.shade100;
      case PositionStatus.correct:
        return const Color(0xFF538D4E);
      case PositionStatus.misPositioned:
        return const Color(0xFFB49F3A);
      case PositionStatus.notFound:
        return const Color(0xFF3A3A3C);
    }
  }
}
