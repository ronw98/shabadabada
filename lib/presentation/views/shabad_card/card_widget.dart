import 'package:flutter/material.dart';
import 'package:shabadapp/domain/entities/card.dart';
import 'package:shabadapp/presentation/theme/colors.dart';
import 'package:shabadapp/presentation/views/shabad_card/card_half_background.dart';
import 'package:shabadapp/presentation/views/shabad_card/card_word.dart';
import 'package:shabadapp/presentation/widgets/card_shape.dart';

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
        child: Stack(
          children: [
            const Positioned.fill(
              child: CardHalfBackground(
                gradient: ShabadColors.yellowPingGradient,
                alignment: Alignment.topCenter,
              ),
            ),
            const Positioned.fill(
              child: CardHalfBackground(
                gradient: ShabadColors.blueGradient,
                alignment: Alignment.bottomCenter,
              ),
            ),
            Positioned.fill(
              child: ShabadCardWord(
                word: card.firstWord,
                gradient: ShabadColors.blueGradient,
                alignment: Alignment.topCenter,
                rotate: false,
              ),
            ),
            Positioned.fill(
              child: ShabadCardWord(
                word: card.secondWord,
                gradient: ShabadColors.yellowPingGradient,
                alignment: Alignment.bottomCenter,
                rotate: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}