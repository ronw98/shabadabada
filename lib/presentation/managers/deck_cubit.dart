import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shabadabada/domain/entities/card.dart';
import 'package:shabadabada/domain/entities/deck.dart';

part 'deck_cubit.freezed.dart';

@lazySingleton
class DeckCubit extends Cubit<DeckState> {
  DeckCubit() : super(const DeckState.initial());

  void loadDeck() {
    emit(const DeckState.loading());

    const deck = ShabadDeck(
      cards: [
        ShabadCard(firstWord: '1', secondWord: '2'),
        ShabadCard(firstWord: '3', secondWord: '4'),
        ShabadCard(firstWord: '5', secondWord: '6'),
        ShabadCard(firstWord: '7', secondWord: '8'),
        ShabadCard(firstWord: '9', secondWord: '10'),
      ],
    );
    emit(const DeckState.loaded(deck: deck));
  }

  void nextCard() {
    state.whenOrNull(
      loaded: (previousDeck) {
        emit(
          DeckState.loaded(
            deck: previousDeck.size == 1
                ? ShabadDeck.empty
                : previousDeck.copyWith(
                    cards: previousDeck.cards.sublist(
                      0,
                      previousDeck.size - 1,
                    ),
                  ),
          ),
        );
      },
    );
  }
}

@freezed
class DeckState with _$DeckState {
  const factory DeckState.initial() = _DeckInitial;

  const factory DeckState.loaded({required ShabadDeck deck}) = _DeckLoaded;

  const factory DeckState.error() = _DeckError;

  const factory DeckState.loading() = _DeckLoading;
}
