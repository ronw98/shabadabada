import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shabadabada/domain/entities/available_words.dart';
import 'package:shabadabada/domain/usecases/get_words.dart';

part 'words_cubit.freezed.dart';

@lazySingleton
class WordsCubit extends Cubit<WordsState> {
  WordsCubit(this.getWords) : super(const WordsState.initial());

  final GetWords getWords;

  Future<void> loadWords() async {
    emit(const WordsState.loading());
    final words = await getWords();

    if (words != null) {
      emit(WordsState.loaded(words: words));
    } else {
      emit(const WordsState.error());
    }
  }
}

@freezed
class WordsState with _$WordsState {
  const factory WordsState.loaded({
    required AvailableWords words,
  }) = _WordsLoaded;

  const factory WordsState.loading() = _WordsLoading;

  const factory WordsState.initial() = _WordsInitial;

  const factory WordsState.error() = _WordsError;
}
