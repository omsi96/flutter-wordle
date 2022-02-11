import 'dart:math';

// void main() {
//   print("Hello World");
//   // print(Couple.zip([1, 2, 3, 4], [9, 8]));
//   print(validateWordPositions("pause", "poses"));
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
