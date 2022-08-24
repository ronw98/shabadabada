import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shabadabada/domain/entities/deck.dart';
import 'package:shabadabada/presentation/managers/deck_cubit.dart';
import 'package:shabadabada/presentation/views/shabad_card/card_widget.dart';
import 'package:shabadabada/presentation/widgets/card_back.dart';
import 'package:shabadabada/presentation/widgets/no_more_cards_widget.dart';

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

  int get displaySize => min(deck.size, maxDeckSize);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: deck.isEmpty
          ? const NoMoreCardWidget()
          : ShabadCardWidget(
              elevation: deck.size.toDouble(),
              card: deck.top,
              onTap: () => BlocProvider.of<DeckCubit>(context).nextCard(),
            ),
    );
  }
}
