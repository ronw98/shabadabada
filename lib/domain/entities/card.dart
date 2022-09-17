import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabadapp/domain/entities/word.dart';

part 'card.freezed.dart';

@freezed
class ShabadCard with _$ShabadCard {
  const ShabadCard._();

  const factory ShabadCard({required Map<Language, Word?> wordByLang}) =
      _ShabadCard;

  Iterable<Language> get languages => wordByLang.entries
      .whereType<MapEntry<Language, Word>>()
      .map((e) => e.key);
}
