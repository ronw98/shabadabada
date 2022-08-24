import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shabadabada/domain/entities/available_words.dart';
import 'package:shabadabada/domain/repositories/words_repository.dart';

@injectable
class GetWords {
  const GetWords(this.repository);
  final WordsRepository repository;
  Future<AvailableWords?> call() {
    return repository.getWords();
  }
}