import 'package:flutter/material.dart';
import 'package:flutter_get/utils/wordle.dart';
import 'package:flutter_get/widgets/wordle/letter.dart';

class Grid extends StatelessWidget {
  Grid(this.lettersGrid, {Key? key}) : super(key: key);
  List<List<LetterPosition>> lettersGrid;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children:
            lettersGrid.map((lettersRow) => LettersRow(lettersRow)).toList(),
      ),
    );
  }
}

class LettersRow extends StatelessWidget {
  const LettersRow(
    this.row, {
    Key? key,
  }) : super(key: key);
  final List<LetterPosition> row;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: row
            .map(
              (letterPosition) => Letter(
                letterPosition: letterPosition,
              ),
            )
            .toList());
  }
}
