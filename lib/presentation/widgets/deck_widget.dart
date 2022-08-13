import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:shabadabada/domain/entities/card.dart';
import 'package:shabadabada/domain/entities/deck.dart';
import 'package:shabadabada/presentation/managers/deck_cubit.dart';
import 'package:shabadabada/presentation/widgets/card_back.dart';
import 'package:shabadabada/presentation/widgets/card_shape.dart';
import 'package:shabadabada/presentation/widgets/card_widget.dart';

const maxDeckSize = 5;

/// A deck of cards
/// Height and width must be constrained
class ShabadDeckWidget extends StatelessWidget {
  const ShabadDeckWidget({
    Key? key,
    required this.deck,
  }) : super(key: key);
  final ShabadDeck deck;

  Widget get hiddenCard => const ShabadCardBack();

  List<Widget> get positionedCards => [
        for (int index = 0; index < displaySize; index++)
          Positioned(
            top: -(index + 1) * 2,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child:
                  index == displaySize - 1 ? topVisible(deck.top) : hiddenCard,
            ),
          ),
      ];

  int get displaySize => min(deck.size, maxDeckSize);

  Widget topVisible(ShabadCard card) => ShabadCardWidget(card: card);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: deck.isEmpty
          ? Align(
              alignment: Alignment.topCenter,
              child: ShabadCardShape(
                child: Center(
                  child: Text(
                    FlutterI18n.translate(context, "deck.no_card"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : InkWell(
              onTap: () => BlocProvider.of<DeckCubit>(context).nextCard(),
              child: Stack(
                clipBehavior: Clip.none,
                children: positionedCards,
              ),
            ),
    );
  }
}
