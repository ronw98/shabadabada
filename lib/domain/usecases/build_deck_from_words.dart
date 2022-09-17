import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:shabadapp/domain/entities/available_words.dart';
import 'package:shabadapp/domain/entities/card.dart';
import 'package:shabadapp/domain/entities/deck.dart';
import 'package:shabadapp/core/utils/list_extension.dart';
import 'package:shabadapp/domain/entities/word.dart';

@injectable
class BuildDeckFromWords {
  ShabadDeck call(AvailableWords availableWords) {
    if(availableWords.wordsByLang.isEmpty) {
      return ShabadDeck.empty;
    }
    // Get the length of the longest list of words
    final maxListLength = availableWords.wordsByLang.values
        .map((words) => words.length)
        .reduce(max);

    // Fill smaller lists with null and shuffle
    final completedWordLists = availableWords.wordsByLang.map(
      (key, value) => MapEntry(
        key,
        value.expandToLength(maxListLength)..shuffle(),
      ),
    );
    final cards = <ShabadCard>[];

    // For each tuple of words from each list, create a card
    for (int i = 0; i < maxListLength; i++) {
      final cardWords = <Language, Word?>{};
      completedWordLists.forEach(
        (language, words) {
          cardWords[language] = words[i];
        },
      );
      cards.add(ShabadCard(wordByLang: cardWords));
    }

    return ShabadDeck(cards: cards);
  }
}
