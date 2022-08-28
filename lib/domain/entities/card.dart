import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabadapp/domain/entities/word.dart';

part 'card.freezed.dart';

@freezed
class ShabadCard with _$ShabadCard {
  const factory ShabadCard({
    required Word firstWord,
    required Word secondWord,
  }) = _ShabadCard;
}