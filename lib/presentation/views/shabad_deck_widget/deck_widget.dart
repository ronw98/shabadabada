import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shabadapp/presentation/managers/deck_cubit.dart';
import 'package:shabadapp/presentation/views/shabad_card/shabad_card_wrapper.dart';
import 'package:shabadapp/presentation/views/shabad_deck_widget/shabad_deck_bottom_controls.dart';
import 'package:shabadapp/presentation/widgets/no_more_cards_widget.dart';
import 'package:shabadapp/presentation/widgets/none_widget.dart';

const maxDeckSize = 5;

/// A deck of cards
/// Height and width must be constrained
class ShabadDeckWidget extends StatelessWidget {
  const ShabadDeckWidget({Key? key, required this.cardWidth}) : super(key: key);

  final double cardWidth;

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
        return Column(
          children: [
            SizedBox(
              width: cardWidth,
              child: deckFinished
                  ? const NoMoreCardWidget()
                  : const ShabadCardWrapper(),
            ),
            const Expanded(child: NoneWidget()),
            const ShabadDeckBottomControls(),
          ],
        );
      },
    );
  }
}
