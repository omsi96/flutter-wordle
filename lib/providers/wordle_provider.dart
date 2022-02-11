import 'package:flutter/material.dart';
import 'package:flutter_get/utils/wordle.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class WordleProvider extends ChangeNotifier {
  var attempts = [
    [
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
    ],
    [
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
    ],
    [
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
    ],
    [
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
    ],
    [
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
    ],
    [
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
      LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated),
    ],
  ];
  // var attempts = [
  //   ...List.filled(6, [
  //     ...List.filled(
  //         5,
  //         LetterPosition(
  //             letter: "", positionStatus: PositionStatus.unvalidated))
  //   ])
  // ];
  var attempt = 0;
  var answer = "PAUSE";
  var charCount = 0;

  void typeLetter(String letter) {
    if (charCount >= 5) return; // Can't type more than 5 letters
    var letterPosition = LetterPosition(
        letter: letter, positionStatus: PositionStatus.unvalidated);
    attempts[attempt][charCount] = letterPosition;

    charCount++;
    notifyListeners();
  }

  void submitAttempt() {
    if (attempt >= 6) {
      print("too sad w rab el3ebad,");
      return;
    }
    if (charCount < 5) {
      print("Complete the word first!");
      return;
    }

    final guessedWord =
        attempts[attempt].map((e) => e.letter).toList().join("");
    print("The gueessed word is $guessedWord");

    attempts[attempt] =
        LetterPosition.validateWordPositions(guessedWord, answer);
    attempt++;
    charCount = 0;
    notifyListeners();
  }

  void erase() {
    print("ERASING");
    if (charCount <= 0) return;
    print("ERASED $charCount");
    charCount--;
    attempts[attempt][charCount] =
        LetterPosition(letter: "", positionStatus: PositionStatus.unvalidated);
    notifyListeners();
  }
}
