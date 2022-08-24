import 'package:shabadabada/data/models/word_model.dart';
import 'package:shabadabada/domain/entities/word.dart';

Word wordModelToEntity(WordModel model) => Word(
      word: model.word!,
      isCategory: model.category!,
      language: Language.values.firstWhere(
        (element) => element.name == model.language,
      ),
      color: WordColor.values.firstWhere(
        (element) => element.name == model.color,
      ),
    );
