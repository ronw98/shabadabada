import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shabadabada/domain/entities/card.dart';
import 'package:shabadabada/presentation/views/shabad_card/card_word.dart';
import 'package:shabadabada/presentation/widgets/card_shape.dart';

class ShabadCardWidget extends StatelessWidget {
  const ShabadCardWidget({
    Key? key,
    required this.card,
    this.elevation = 4,
    this.onTap,
  }) : super(key: key);
  final ShabadCard card;
  final Function()? onTap;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return ShabadCardShape(
      elevation: elevation,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Transform.rotate(
                    angle: pi,
                    child: ShabadCardWord(word: card.firstWord, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: ShabadCardWord(word: card.secondWord, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
