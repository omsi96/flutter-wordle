import 'package:flutter/material.dart';
import 'package:flutter_get/providers/wordle_provider.dart';
import 'package:provider/provider.dart';

class KeyboardButton extends StatelessWidget {
  KeyboardButton({this.text, this.icon, this.width = 34, Key? key})
      : super(key: key);
  String? text;
  IconData? icon;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Color(0xff818384)),
        margin: const EdgeInsets.all(2),
        width: width,
        height: 60,
        child: (text != null)
            ? Text(text!,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))
            : Icon(
                icon,
                size: 18,
              ));
  }
}
