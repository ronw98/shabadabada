import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shabadabada/domain/entities/available_words.dart';
import 'package:shabadabada/domain/entities/card.dart';
import 'package:shabadabada/domain/entities/deck.dart';

part 'deck_cubit.freezed.dart';

@lazySingleton
class DeckCubit extends Cubit<DeckState> {
  DeckCubit() : super(const DeckState.initial());

  void loadDeck(AvailableWords words) {
    emit(const DeckState.loading());
    final shuffledWords = words.words.values.toList()..shuffle();
    final deckContent = <ShabadCard>[];
    for (int i = 0; i < shuffledWords.length - 1; i += 2) {
      deckContent.add(
        ShabadCard(
          firstWord: shuffledWords[i],
          secondWord: shuffledWords[i + 1],
        ),
      );
    }
    emit(
      DeckState.loaded(
        deck: ShabadDeck(cards: deckContent),
      ),
    );
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
