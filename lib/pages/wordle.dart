import 'package:flutter/material.dart';
import 'package:flutter_get/controller/wordle.controller.dart';
import 'package:flutter_get/utils/wordle.dart';
import 'package:flutter_get/widgets/wordle/grid.dart';
import 'package:flutter_get/widgets/wordle/keyboard.dart';
import 'package:flutter_get/widgets/wordle/letter.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import "package:get/get.dart";

class Wordle extends StatefulWidget {
  Wordle({Key? key}) : super(key: key);

  @override
  State<Wordle> createState() => _WordleState();
}

class _WordleState extends State<Wordle> {
  WordleController controller = Get.put(WordleController());
  @override
  Widget build(BuildContext context) {
    final lettersOfGrid = controller.attempts as List<List<LetterPosition>>;
    return Scaffold(
      appBar: AppBar(
        title: Text("WORDLE!"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Grid(lettersOfGrid),
            // ElevatedButton(
            //     onPressed: () {
            //       controller.typeLetter("B");
            //     },
            //     child: Text("B")),
            Spacer(),
            Keyboard(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
