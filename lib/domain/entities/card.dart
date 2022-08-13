import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';

@freezed
class ShabadCard with _$ShabadCard {
  const factory ShabadCard({
    required String firstWord,
    required String secondWord,
  }) = _ShabadCard;
}