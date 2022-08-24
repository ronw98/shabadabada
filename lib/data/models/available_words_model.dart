import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabadabada/data/models/word_model.dart';

part 'available_words_model.freezed.dart';

part 'available_words_model.g.dart';

@freezed
class AvailableWordsModel with _$AvailableWordsModel {
  const factory AvailableWordsModel({
    List<WordModel>? words,
  }) = _AvailableWordsModel;

  factory AvailableWordsModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableWordsModelFromJson(json);
}
