import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.freezed.dart';

enum Language {
  fr, en
}

enum WordColor {
  white, black
}

@freezed
class Word with _$Word {
  const factory Word({
    required String word,
    required bool isCategory,
    required Language language,
    required WordColor color,
  }) = _Word;
}