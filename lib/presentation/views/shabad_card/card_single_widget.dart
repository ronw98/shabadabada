import 'package:flutter/material.dart';
import 'package:shabadapp/domain/entities/word.dart';
import 'package:shabadapp/presentation/theme/colors.dart';
import 'package:shabadapp/presentation/views/shabad_card/card_word.dart';
import 'package:shabadapp/presentation/widgets/card_shape.dart';
import 'package:shabadapp/presentation/widgets/gradient_mask_widget.dart';

class ShabadCardSingleWidget extends StatelessWidget {
  const ShabadCardSingleWidget({
    Key? key,
    required this.word,
    this.elevation = 4,
    this.onTap,
  }) : super(key: key);
  final Function()? onTap;
  final double elevation;
  final Word word;

  @override
  Widget build(BuildContext context) {
    return ShabadCardShape(
      elevation: elevation,
      aspectRatio: 9 / 15,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned.fill(
              child: GradientMaskWidget(
                gradient: ShabadColors.yellowPinkGradient,
                child: Container(color: ShabadColors.white),
              ),
            ),
            Positioned.fill(
              child: ShabadCardWord(
                word: word,
                gradient: ShabadColors.blueGradient,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
