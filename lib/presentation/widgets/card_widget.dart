import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shabadabada/domain/entities/card.dart';
import 'package:shabadabada/presentation/widgets/card_shape.dart';

class ShabadCardWidget extends StatelessWidget {
  const ShabadCardWidget({
    Key? key,
    required this.card,
  }) : super(key: key);
  final ShabadCard card;

  @override
  Widget build(BuildContext context) {
    return ShabadCardShape(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: Center(
                child: Transform.rotate(
                  angle: pi,
                  child: Text(
                    card.firstWord,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  card.secondWord,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
