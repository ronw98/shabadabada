import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shabadapp/domain/entities/available_words.dart';
import 'package:shabadapp/domain/entities/deck.dart';
import 'package:shabadapp/domain/usecases/build_deck_from_words.dart';
import 'package:shabadapp/presentation/exceptions/deck_exception.dart';

part 'deck_cubit.freezed.dart';

@lazySingleton
class DeckCubit extends Cubit<DeckState> {
  DeckCubit(BuildDeckFromWords buildDeckFromWords)
      : _buildDeckFromWords = buildDeckFromWords,
        super(const DeckState.initial());

  final BuildDeckFromWords _buildDeckFromWords;

  void loadDeck(AvailableWords words) {
    emit(const DeckState.loading());
    final deck = _buildDeckFromWords(words);
    emit(
      DeckState.loaded(
        deck: deck,
      ),
    );
  }

  void nextCard() {
    state.mapOrNull(
      loaded: (loadedState) {
        if (loadedState.deckFinished) {
          return;
        }
        emit(
          DeckState.loaded(
            deck: loadedState.deck,
            index: loadedState.index + 1,
          ),
        );
      },
    );
  }

  void previousCard() {
    state.whenOrNull(
      loaded: (deck, index) {
        if (index == 0) {
          return;
        }
        emit(DeckState.loaded(deck: deck, index: index - 1));
      },
    );
  }

  void restart(AvailableWords words) => loadDeck(words);
}

@freezed
class DeckState with _$DeckState {
  const DeckState._();

  const factory DeckState.initial() = _DeckInitial;

  const factory DeckState.loaded({
    required ShabadDeck deck,
    @Default(0) int index,
  }) = _DeckLoaded;

  const factory DeckState.error() = _DeckError;

  const factory DeckState.loading() = _DeckLoading;

  bool get deckFinished => maybeWhen(
        loaded: (deck, index) => deck.size == index,
        orElse: () => throw DeckException('Deck is not loaded'),
      );

  bool get canGoBack => maybeWhen(
        loaded: (_, index) => index > 0,
        orElse: () => throw DeckException('Deck is not loaded'),
      );

  bool get hasNext => maybeWhen(
        loaded: (deck, index) => index < deck.size,
        orElse: () => throw DeckException('Deck is not loaded'),
      );
}
