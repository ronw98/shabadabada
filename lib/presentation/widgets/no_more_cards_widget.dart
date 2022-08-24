import 'package:flutter/material.dart';
import 'package:shabadabada/jsons.dart';
import 'package:shabadabada/presentation/extensions/locale_extensions.dart';
import 'package:shabadabada/presentation/widgets/card_shape.dart';

class NoMoreCardWidget extends StatelessWidget {
  const NoMoreCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShabadCardShape(
      elevation: 0,
      child: Center(
        child: Text(
          Locales.deck.no_card.translate(context),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
