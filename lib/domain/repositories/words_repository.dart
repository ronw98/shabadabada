import 'dart:async';

import 'package:shabadabada/domain/entities/available_words.dart';

abstract class WordsRepository {
  Future<AvailableWords?> getWords();
}