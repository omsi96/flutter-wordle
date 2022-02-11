import 'package:flutter/material.dart';
import 'package:flutter_get/controller/wordle.controller.dart';
import 'package:flutter_get/providers/wordle_provider.dart';
import 'package:flutter_get/utils/wordle.dart';
import 'package:flutter_get/widgets/wordle/grid.dart';
import 'package:flutter_get/widgets/wordle/keyboard.dart';
import 'package:flutter_get/widgets/wordle/letter.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import "package:get/get.dart";
import 'package:provider/provider.dart';

class Wordle extends StatefulWidget {
  Wordle({Key? key}) : super(key: key);

  @override
  State<Wordle> createState() => _WordleState();
}

class _WordleState extends State<Wordle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WORDLE!"),
        actions: [
          InkWell(
            child: Container(
                margin: EdgeInsets.all(6), child: Icon(Icons.loop_rounded)),
            onTap: () =>
                Provider.of<WordleProvider>(context, listen: false).reset(),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Consumer<WordleProvider>(
                builder: (context, provider, child) => Column(
                      children: [
                        Text(
                          provider.gameStatus == GameStatus.lost
                              ? "YOU LOST"
                              : "",
                          style: const TextStyle(fontSize: 24),
                        ),
                        Grid(provider.attempts),
                      ],
                    )),
            Spacer(),
            Keyboard(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
