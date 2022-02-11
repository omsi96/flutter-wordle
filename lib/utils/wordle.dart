import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_get/widgets/wordle/letter.dart';
//
// void main() {
//   var attemptedLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
//       .split("")
//       .map(
//         (letter) => LetterPosition(
//             letter: letter, positionStatus: PositionStatus.unvalidated),
//       )
//       .toList();
//   print(attemptedLetters);
//   print("");
//   var guessWord = [
//     LetterPosition(letter: "P", positionStatus: PositionStatus.correct),
//     LetterPosition(letter: "A", positionStatus: PositionStatus.misPositioned),
//     LetterPosition(letter: "U", positionStatus: PositionStatus.misPositioned),
//     LetterPosition(letter: "S", positionStatus: PositionStatus.notFound),
//     LetterPosition(letter: "E", positionStatus: PositionStatus.notFound),
//   ];
//   LetterPosition.mutateValidateKeyboard(attemptedLetters, guessWord);
//   print(attemptedLetters);
// }

const WORD_LENGTH = 5;
enum PositionStatus { notFound, misPositioned, correct, unvalidated }

class LetterPosition {
  String letter;
  PositionStatus positionStatus;
  LetterPosition({
    required this.letter,
    required this.positionStatus,
  });
  @override
  String toString() {
    return "($letter, $positionStatus)";
  }

  static List<LetterPosition> validateWordPositions(
      String guessedWord, String answerWord) {
    if (!(isCorrectLength(guessedWord) && isCorrectLength(answerWord))) {
      throw Error();
    }

    var guessedWordArray = guessedWord.toUpperCase().split("");
    var answerWordArray = answerWord.toUpperCase().split("");

    var zippedWord = Couple.zip(guessedWordArray, answerWordArray);

    var x = zippedWord.map((couple) {
      if (couple.first == couple.second) {
        return LetterPosition(
            letter: couple.first, positionStatus: PositionStatus.correct);
      } else if (answerWordArray.contains(couple.first)) {
        return LetterPosition(
            letter: couple.first, positionStatus: PositionStatus.misPositioned);
      } else {
        return LetterPosition(
            letter: couple.first, positionStatus: PositionStatus.notFound);
      }
    }).toList();
    return x;
  }

  static PositionStatus positionStatusPower(
      PositionStatus p1, PositionStatus p2) {
    if (p1 == PositionStatus.correct || p2 == PositionStatus.correct) {
      return PositionStatus.correct;
    }
    if (p1 == PositionStatus.misPositioned ||
        p2 == PositionStatus.misPositioned) {
      return PositionStatus.misPositioned;
    }
    if (p1 == PositionStatus.notFound || p2 == PositionStatus.notFound) {
      return PositionStatus.notFound;
    }
    return PositionStatus.unvalidated;
  }

  static void mutateValidateKeyboard(List<LetterPosition> keyboard,
      List<LetterPosition> validatedWordPosition) {
    for (var guessedLetter in validatedWordPosition) {
      var foundElement = keyboard
          .firstWhere((element) => element.letter == guessedLetter.letter);
      foundElement.positionStatus = positionStatusPower(
          guessedLetter.positionStatus, foundElement.positionStatus);
    }
  }

  static bool isCorrectLength(String word) => word.length == WORD_LENGTH;
}

// e.g.
// word: PAUSE
// letter: U
// position: 0
// this should return misPositioned

class Couple<T> {
  T first;
  T second;
  Couple(this.first, this.second);

  @override
  String toString() {
    return "($first, $second)";
  }

  // STRICTLY COMAPRES LENGTHS
  // This will crash if the two words don't have the same length
  static List<Couple<T>> zip<T>(List<T> arr1, List<T> arr2) {
    // 1,2,3
    // 4,5,6,7,8
    // (1,4), (2,5), (3,6), (null, 7), (null, 8)
    List<Couple<T>> temp = [];
    int length = max(arr1.length, arr2.length);
    for (int i = 0; i < length; i++) {
      temp.add(Couple(arr1[i], arr2[i]));
    }
    return temp;
  }
}

class Wordle {
  // Fetch content from the json file
  static Future<String> getRandomWord() async {
    final String response = await rootBundle.loadString('assets/dataset.json');
    final data = json.decode(response);
    // print("DATA: $data");
    return data[Random().nextInt(data.length)];
  }

  static Future<bool> validateWord(String word) async {
    final String response = await rootBundle.loadString('assets/dataset.json');
    // print("RESPONSE: $response");
    final data = (json.decode(response) as List)
        .map((e) => (e as String).toLowerCase())
        .toList();
    print("LIST: ${data.runtimeType}");

    return data.contains(word.toLowerCase());
  }
}
