import 'package:flutter_get/utils/wordle.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class WordleController extends GetxController {
  RxList attempts = [
    [
      LetterPosition(letter: "E", positionStatus: PositionStatus.misPositioned),
      LetterPosition(letter: "N", positionStatus: PositionStatus.notFound),
      LetterPosition(letter: "T", positionStatus: PositionStatus.notFound),
      LetterPosition(letter: "R", positionStatus: PositionStatus.misPositioned),
      LetterPosition(letter: "Y", positionStatus: PositionStatus.notFound),
    ],
    [
      LetterPosition(letter: "P", positionStatus: PositionStatus.notFound),
      LetterPosition(letter: "A", positionStatus: PositionStatus.notFound),
      LetterPosition(letter: "U", positionStatus: PositionStatus.misPositioned),
      LetterPosition(letter: "S", positionStatus: PositionStatus.notFound),
      LetterPosition(letter: "E", positionStatus: PositionStatus.misPositioned),
    ],
    [
      LetterPosition(letter: "O", positionStatus: PositionStatus.notFound),
      LetterPosition(letter: "V", positionStatus: PositionStatus.notFound),
      LetterPosition(letter: "A", positionStatus: PositionStatus.notFound),
      LetterPosition(letter: "L", positionStatus: PositionStatus.misPositioned),
      LetterPosition(letter: "S", positionStatus: PositionStatus.notFound),
    ],
    [
      LetterPosition(letter: "R", positionStatus: PositionStatus.misPositioned),
      LetterPosition(letter: "U", positionStatus: PositionStatus.misPositioned),
      LetterPosition(letter: "L", positionStatus: PositionStatus.misPositioned),
      LetterPosition(letter: "E", positionStatus: PositionStatus.correct),
      LetterPosition(letter: "S", positionStatus: PositionStatus.notFound),
    ],
    [
      LetterPosition(letter: "C", positionStatus: PositionStatus.misPositioned),
      LetterPosition(letter: "R", positionStatus: PositionStatus.misPositioned),
      LetterPosition(letter: "U", positionStatus: PositionStatus.misPositioned),
      LetterPosition(letter: "E", positionStatus: PositionStatus.correct),
      LetterPosition(letter: "L", positionStatus: PositionStatus.misPositioned),
    ],
    [
      LetterPosition(letter: "U", positionStatus: PositionStatus.correct),
      LetterPosition(letter: "L", positionStatus: PositionStatus.correct),
      LetterPosition(letter: "C", positionStatus: PositionStatus.correct),
      LetterPosition(letter: "E", positionStatus: PositionStatus.correct),
      LetterPosition(letter: "R", positionStatus: PositionStatus.correct),
    ],
  ].obs;
  // RxList attempts = List.filled(
  //         6,
  //         List.filled(
  //             5,
  //             LetterPosition(
  //                 letter: "", positionStatus: PositionStatus.unvalidated)))
  //     .obs;
  var attempt = 0.obs;
  var answer = "PAUSE".obs;

  void typeLetter(String letter) {
    var charCount = attempts[attempt.toInt()].length;
    if (charCount >= 5) return; // Can't type more than 5 letters
    var letterPosition = LetterPosition(
        letter: letter, positionStatus: PositionStatus.unvalidated);
    attempts[attempt.toInt()].add(letterPosition);
  }

  void submitAttempt() {
    if (attempt >= 6) {
      print("too sad w rab el3ebad,");
      return;
    }
    final guessedWord = attempts[attempt.toInt()].join("");

    attempts[attempt.toInt()] =
        LetterPosition.validateWordPositions(guessedWord, answer.string);
    attempt++;
  }

  void erase() {
    if (attempts[attempt.toInt()].isEmpty) return;
    attempts[attempt.toInt()].removeLast();
  }
}
