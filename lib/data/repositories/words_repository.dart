import 'package:injectable/injectable.dart';
import 'package:shabadabada/data/adapters/available_words_adapter.dart';
import 'package:shabadabada/data/datasources/words_datasource.dart';
import 'package:shabadabada/domain/entities/available_words.dart';
import 'package:shabadabada/domain/repositories/words_repository.dart';

@Injectable(as: WordsRepository)
class WordsRepositoryImpl extends WordsRepository {

  final WordsDataSource dataSource;

  WordsRepositoryImpl(this.dataSource);
  @override
  Future<AvailableWords?> getWords() async {
    try {
      final model = await dataSource.getWords();
      return availableWordsModelToEntity(model);
    } catch(e) {
      return null;
    }
  }

}