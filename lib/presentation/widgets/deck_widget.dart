import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shabadapp/presentation/managers/deck_cubit.dart';
import 'package:shabadapp/presentation/views/shabad_card/shabad_card_wrapper.dart';
import 'package:shabadapp/presentation/widgets/no_more_cards_widget.dart';

const maxDeckSize = 5;

/// A deck of cards
/// Height and width must be constrained
class ShabadDeckWidget extends StatelessWidget {
  const ShabadDeckWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DeckCubit, DeckState, bool>(
      selector: (state) {
        return state.maybeMap(
          loaded: (value) => value.deckFinished,
          orElse: () => false,
        );
      },
      builder: (context, deckFinished) {
        return Padding(
          padding: const EdgeInsets.only(top: 12),
          child: deckFinished
              ? const NoMoreCardWidget()
              : const ShabadCardWrapper(),
        );
      },
    );
  }
}
