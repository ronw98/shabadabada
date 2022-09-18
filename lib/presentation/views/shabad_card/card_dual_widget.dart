import 'package:flutter/material.dart';
import 'package:shabadapp/domain/entities/word.dart';
import 'package:shabadapp/presentation/theme/colors.dart';
import 'package:shabadapp/presentation/views/shabad_card/card_half_background.dart';
import 'package:shabadapp/presentation/views/shabad_card/card_word.dart';
import 'package:shabadapp/presentation/widgets/card_shape.dart';

class ShabadCardDualWidget extends StatelessWidget {
  const ShabadCardDualWidget({
    Key? key,
    required this.word1,
    required this.word2,
    this.elevation = 4,
    this.onTap,
  }) : super(key: key);
  final Word? word1;
  final Word? word2;
  final Function()? onTap;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return ShabadCardShape(
      elevation: elevation,
      aspectRatio: 9/15,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            const Positioned.fill(
              child: CardHalfBackground(
                gradient: ShabadColors.yellowPinkGradient,
                alignment: Alignment.topCenter,
              ),
            ),
            const Positioned.fill(
              child: CardHalfBackground(
                gradient: ShabadColors.blueGradient,
                alignment: Alignment.bottomCenter,
              ),
            ),
            if (word1 != null)
              Positioned.fill(
                child: ShabadCardWord(
                  word: word1!,
                  gradient: ShabadColors.blueGradient,
                  alignment: Alignment.topCenter,
                ),
              ),
            if (word2 != null)
              Positioned.fill(
                child: ShabadCardWord(
                  word: word2!,
                  gradient: ShabadColors.yellowPinkGradient,
                  alignment: Alignment.bottomCenter,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
