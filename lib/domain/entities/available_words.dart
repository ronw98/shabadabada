import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabadapp/domain/entities/word.dart';

part 'available_words.freezed.dart';

@freezed
class AvailableWords with _$AvailableWords {
  const factory AvailableWords({
    required Map<String, Word> words,
  }) = _AvailableWords;
}
