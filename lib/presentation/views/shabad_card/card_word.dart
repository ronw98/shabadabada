import 'package:flutter/material.dart';
import 'package:shabadabada/domain/entities/word.dart';

class ShabadCardWord extends StatelessWidget {
  const ShabadCardWord({
    Key? key,
    required this.word,
    required this.color,
  }) : super(key: key);
  final Word word;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      word.word,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        color: color,
        fontWeight: FontWeight.bold,
        fontStyle: word.isCategory ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}
