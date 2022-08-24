import 'package:shabadabada/data/adapters/adapter_utils.dart';
import 'package:shabadabada/data/adapters/word_adapter.dart';
import 'package:shabadabada/data/models/available_words_model.dart';
import 'package:shabadabada/domain/entities/available_words.dart';

AvailableWords availableWordsModelToEntity(AvailableWordsModel model) {
  final words = modelEntityListConverter(model.words, wordModelToEntity);

  return AvailableWords(
    words: listWithIdToMap(words, (word) => word.word),
  );
}
