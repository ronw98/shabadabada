import 'package:collection/collection.dart';
import 'package:shabadapp/data/adapters/adapter_utils.dart';
import 'package:shabadapp/data/adapters/word_adapter.dart';
import 'package:shabadapp/data/models/available_words_model.dart';
import 'package:shabadapp/domain/entities/available_words.dart';
import 'package:shabadapp/domain/entities/word.dart';

AvailableWords availableWordsModelToEntity(AvailableWordsModel model) {
  final Map<Language, List<Word>> convertedWordsByLang = Map.fromEntries(
    model.wordsByLang
            ?.map(
              (langString, words) => MapEntry(
                Language.values.firstWhereOrNull((l) => l.name == langString),
                modelEntityListConverter(words, wordModelToEntity),
              ),
            )
            .entries
            .where((e) => e.key != null && e.value != null)
            .map<MapEntry<Language, List<Word>>>(
              (e) => MapEntry(e.key!, e.value!),
            ) ??
        {},
  );

  return AvailableWords(wordsByLang: convertedWordsByLang);
}
