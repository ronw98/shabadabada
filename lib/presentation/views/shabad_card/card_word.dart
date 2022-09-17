import 'package:flutter/material.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/domain/entities/word.dart';
import 'package:shabadapp/presentation/widgets/card_label.dart';

class ShabadCardWord extends StatelessWidget {
  const ShabadCardWord({
    Key? key,
    required this.word,
    required this.gradient,
    required this.alignment,
  }) : super(key: key);

  final Word word;
  final Gradient gradient;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return ShabadCardLabel(
      alignment: alignment,
      gradient: gradient,
      label: word.word,
      padding: const EdgeInsets.all(8.0),
      style: TextStyle(
        fontSize: 40,
        fontFamily: Fonts.berlinSansMedium,
        fontStyle: word.isCategory ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}
