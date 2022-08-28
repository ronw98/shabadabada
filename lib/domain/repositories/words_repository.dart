import 'dart:async';

import 'package:shabadapp/domain/entities/available_words.dart';

abstract class WordsRepository {
  Future<AvailableWords?> getWords();
}