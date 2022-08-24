import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:shabadabada/assets.dart';
import 'package:shabadabada/data/models/available_words_model.dart';

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
        'words': jsonDecode(englishWords),
      },
    );

    final AvailableWordsModel frenchModel = AvailableWordsModel.fromJson(
      {
        'words': jsonDecode(frenchWords),
      },
    );

    return AvailableWordsModel(
      words: [
        ...englishModel.words ?? [],
        ...frenchModel.words ?? [],
      ],
    );
  }
}
