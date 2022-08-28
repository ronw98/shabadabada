import 'package:injectable/injectable.dart';
import 'package:shabadapp/data/adapters/available_words_adapter.dart';
import 'package:shabadapp/data/datasources/words_datasource.dart';
import 'package:shabadapp/domain/entities/available_words.dart';
import 'package:shabadapp/domain/repositories/words_repository.dart';

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