import 'package:flutter/material.dart';
import 'package:flutter_get/utils/wordle.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

enum GameStatus { playing, lost, won }

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

  var attemptedLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      .split("")
      .map(
        (letter) => LetterPosition(
            letter: letter, positionStatus: PositionStatus.unvalidated),
      )
      .toList();

  var attempt = 0;
  var answer = "";
  var charCount = 0;
  var gameStatus = GameStatus.playing;

  WordleProvider() {
    fetchWord();
  }

  void fetchWord() async {
    answer = await Wordle.getRandomWord();
    print("ANSWERE: $answer");
    notifyListeners();
  }

  void typeLetter(String letter) {
    if (charCount >= 5) return; // Can't type more than 5 letters
    var letterPosition = LetterPosition(
        letter: letter, positionStatus: PositionStatus.unvalidated);
    attempts[attempt][charCount] = letterPosition;

    charCount++;
    notifyListeners();
  }

  Future<String> submitAttempt() async {
    if (attempt >= 5) {
      gameStatus = GameStatus.lost;
      return "You lost. the word is $answer";
    }
    if (charCount < 5) {
      print("Complete the word first!");
      return "Word incomplete";
    }

    final guessedWord =
        attempts[attempt].map((e) => e.letter).toList().join("");
    print("The gueessed word is $guessedWord");

    final validWord = await Wordle.validateWord(guessedWord);
    print("is valid word: $validWord");
    if (!validWord) {
      print("$guessedWord is not a word!");
      return "$guessedWord is not a word!";
    }

    var validatedGuess =
        LetterPosition.validateWordPositions(guessedWord, answer);
    attempts[attempt] = validatedGuess;
    LetterPosition.mutateValidateKeyboard(attemptedLetters, validatedGuess);
    attempt++;
    charCount = 0;
    if (guessedWord == answer) {
      // WINNING
      gameStatus = GameStatus.won;
    }
    notifyListeners();
    return "";
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

  void reset() {
    charCount = 0;
    attempt = 0;
    gameStatus = GameStatus.playing;
    attempts = [
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
    fetchWord();

    attemptedLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        .split("")
        .map(
          (letter) => LetterPosition(
              letter: letter, positionStatus: PositionStatus.unvalidated),
        )
        .toList();
  }

  LetterPosition keyboardLetterPosition(String letter) {
    final result =
        attemptedLetters.firstWhere((element) => element.letter == letter);
    print("KEYBIARD: $result");
    return result;
  }
}
