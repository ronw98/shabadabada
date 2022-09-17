import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/data/models/available_words_model.dart';
import 'package:shabadapp/domain/entities/word.dart';

abstract class WordsDataSource {
  Future<AvailableWordsModel> getWords();
}

@Injectable(as: WordsDataSource)
class WordsLocalDataSourceImpl extends WordsDataSource {
  @override
  Future<AvailableWordsModel> getWords() async {
    final englishWords = await rootBundle.loadString(Assets.wordsEn);
    final frenchWords = await rootBundle.loadString(Assets.wordsFr);

    final AvailableWordsModel englishModel = AvailableWordsModel.fromJson(
      {
        'wordsByLang': {
          Language.en.name: jsonDecode(englishWords),
        },
      },
    );

    final AvailableWordsModel frenchModel = AvailableWordsModel.fromJson(
      {
        'wordsByLang': {
          Language.fr.name: jsonDecode(frenchWords),
        },
      },
    );

    return AvailableWordsModel(
      wordsByLang: {
        if (englishModel.wordsByLang?.isNotEmpty ?? false)
          ...englishModel.wordsByLang!,
        if (frenchModel.wordsByLang?.isNotEmpty ?? false)
          ...frenchModel.wordsByLang!,
      },
    );
  }
}
