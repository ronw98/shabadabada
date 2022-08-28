import 'package:shabadapp/data/adapters/adapter_utils.dart';
import 'package:shabadapp/data/adapters/word_adapter.dart';
import 'package:shabadapp/data/models/available_words_model.dart';
import 'package:shabadapp/domain/entities/available_words.dart';

AvailableWords availableWordsModelToEntity(AvailableWordsModel model) {
  final words = modelEntityListConverter(model.words, wordModelToEntity);

  return AvailableWords(
    words: listWithIdToMap(words, (word) => word.word),
  );
}
