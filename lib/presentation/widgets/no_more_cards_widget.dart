import 'package:flutter/material.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/jsons.dart';
import 'package:shabadapp/presentation/extensions/locale_extensions.dart';
import 'package:shabadapp/presentation/theme/colors.dart';
import 'package:shabadapp/presentation/widgets/card_shape.dart';
import 'package:shabadapp/presentation/widgets/gradient_mask_widget.dart';

class NoMoreCardWidget extends StatelessWidget {
  const NoMoreCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShabadCardShape(
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
          gradient: ShabadColors.yellowPingGradient,
        ),
        child: GradientMaskWidget(
          gradient: ShabadColors.blueGradient,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Locales.deck.no_card.translate(context),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: Fonts.berlinSansMedium,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
