import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shabadapp/domain/entities/word.dart';
import 'package:shabadapp/presentation/extensions/string_utils.dart';
import 'package:shabadapp/presentation/managers/deck_cubit.dart';
import 'package:shabadapp/presentation/views/radio_buttons/radio_buttons.dart';
import 'package:shabadapp/presentation/views/shabad_card/card_dual_widget.dart';
import 'package:shabadapp/presentation/views/shabad_card/card_single_widget.dart';
import 'package:shabadapp/presentation/widgets/no_more_cards_widget.dart';

class ShabadCardWrapper extends StatefulWidget {
  const ShabadCardWrapper({Key? key}) : super(key: key);

  @override
  State<ShabadCardWrapper> createState() => _ShabadCardWrapperState();
}

class _ShabadCardWrapperState extends State<ShabadCardWrapper> {
  Language? selectedLanguage;

  @override
  void initState() {
    initLanguage();
    super.initState();
  }

  void initLanguage() {
    final availableWords = BlocProvider.of<DeckCubit>(context).state.whenOrNull(
          loaded: (deck, index) => deck.fromTop(index).wordByLang,
        );

    if (availableWords != null) {
      // If exactly two entries, show dual card
      if (availableWords.values.whereType<Word>().length == 2) {
        selectedLanguage = null;
      } else {
        // Select first non null language
        selectedLanguage = availableWords.entries
            .where((entry) => entry.value != null)
            .firstOrNull
            ?.key;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeckCubit, DeckState>(
      listenWhen: (previous, next) =>
          previous.maybeWhen(
            loaded: (_, index) => index,
            orElse: () => -1,
          ) !=
          next.maybeWhen(
            loaded: (_, index) => index,
            orElse: () => -1,
          ),
      listener: (context, state) {
        initLanguage();
      },
      child: BlocBuilder<DeckCubit, DeckState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (deck, index) {
              final card = deck.fromTop(index);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (selectedLanguage != null)
                    ShabadCardSingleWidget(
                      elevation: deck.size.toDouble(),
                      word: card.wordByLang[selectedLanguage]!,
                      onTap: BlocProvider.of<DeckCubit>(context).nextCard,
                    )
                  else
                    ShabadCardDualWidget(
                      elevation: deck.size.toDouble(),
                      word1: card.wordByLang.values.whereType<Word>().first,
                      word2: card.wordByLang.values
                          .whereType<Word>()
                          .toList()
                          .elementAt(1),
                      onTap: BlocProvider.of<DeckCubit>(context).nextCard,
                    ),
                  const SizedBox(height: 8),
                  RadioButtons<Language>(
                    selected: selectedLanguage,
                    options: card.wordByLang.entries
                        .where((e) => e.value != null)
                        .map((e) => e.key)
                        .toList(),
                    itemToString: (lang) => lang.name.capitalize,
                    onItemTap: (newLang) => setState(() {
                      selectedLanguage = newLang;
                    }),
                  ),
                ],
              );
            },
            orElse: () => const NoMoreCardWidget(),
          );
        },
      ),
    );
  }
}
