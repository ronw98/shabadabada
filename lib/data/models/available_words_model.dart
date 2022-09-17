import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabadapp/data/models/word_model.dart';

part 'available_words_model.freezed.dart';

part 'available_words_model.g.dart';

@freezed
class AvailableWordsModel with _$AvailableWordsModel {
  const factory AvailableWordsModel({
    Map<String, List<WordModel>>? wordsByLang,
  }) = _AvailableWordsModel;

  factory AvailableWordsModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableWordsModelFromJson(json);
}
