import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shabadapp/domain/entities/word.dart';
import 'package:shabadapp/presentation/extensions/string_utils.dart';
import 'package:shabadapp/presentation/managers/deck_cubit.dart';
import 'package:shabadapp/presentation/views/radio_buttons/radio_buttons.dart';
import 'package:shabadapp/presentation/views/shabad_card/card_widget.dart';
import 'package:shabadapp/presentation/widgets/no_more_cards_widget.dart';

class ShabadCardWrapper extends StatefulWidget {
  const ShabadCardWrapper({Key? key}) : super(key: key);

  @override
  State<ShabadCardWrapper> createState() => _ShabadCardWrapperState();
}

class _ShabadCardWrapperState extends State<ShabadCardWrapper> {
  late Language selectedLanguage;

  @override
  void initState() {
    selectedLanguage = BlocProvider.of<DeckCubit>(context).state.maybeWhen(
          loaded: (deck, index) => deck
              .fromTop(index)
              .wordByLang
              .entries
              .where((e) => e.value != null)
              .first
              .key,
          orElse: () => Language.values.first,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeckCubit, DeckState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (deck, index) {
            final card = deck.fromTop(index);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShabadCardWidget(
                  elevation: deck.size.toDouble(),
                  word: card.wordByLang[selectedLanguage]!,
                  onTap: () => BlocProvider.of<DeckCubit>(context).nextCard(),
                ),
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
    );
  }
}
