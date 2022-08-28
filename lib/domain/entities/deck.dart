import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabadapp/domain/entities/card.dart';

part 'deck.freezed.dart';

@freezed
class ShabadDeck with _$ShabadDeck {
  const ShabadDeck._();

  const factory ShabadDeck({
    required List<ShabadCard> cards,
  }) = _ShabadDeck;

  static ShabadDeck empty = const ShabadDeck(cards: []);

  ShabadCard? get maybeTop => cards.lastOrNull;

  ShabadCard get top => cards.last;

  int get size => cards.length;

  bool get isEmpty => cards.isEmpty;


}
