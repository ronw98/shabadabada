import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shabadapp/jsons.dart';
import 'package:shabadapp/presentation/extensions/locale_extensions.dart';
import 'package:shabadapp/presentation/managers/deck_cubit.dart';
import 'package:shabadapp/presentation/managers/words_cubit.dart';
import 'package:shabadapp/presentation/views/confirmation_dialog.dart';
import 'package:shabadapp/presentation/widgets/none_widget.dart';
import 'package:shabadapp/presentation/widgets/shabad_button.dart';

class ShabadDeckBottomControls extends StatelessWidget {
  const ShabadDeckBottomControls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocSelector<DeckCubit, DeckState, bool>(
              selector: (state) => state.canGoBack,
              builder: (context, canGoBack) {
                if (!canGoBack) {
                  return const NoneWidget();
                }
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ShabadButton(
                    elevation: 0,
                    onTap: BlocProvider.of<DeckCubit>(context).previousCard,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.arrow_back_ios),
                            AutoSizeText(
                              Locales.core.previous.translate(context),
                              maxFontSize: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            BlocSelector<DeckCubit, DeckState, bool>(
              selector: (state) => state.hasNext,
              builder: (context, hasNext) {
                if (!hasNext) {
                  return const NoneWidget();
                }
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ShabadButton(
                    elevation: 0,
                    onTap: BlocProvider.of<DeckCubit>(context).nextCard,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              Locales.core.next.translate(context),
                              maxFontSize: 18,
                            ),
                            const Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        Positioned.fill(
          child: Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: ShabadButton(
                elevation: 0,
                onTap: () => _onResetTap(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Icon(Icons.replay),
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }

  void _onResetTap(BuildContext context) async {
    final words = BlocProvider.of<WordsCubit>(context)
        .state
        .whenOrNull(loaded: (words) => words);

    final DeckCubit deckCubit = BlocProvider.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final snackBarErrorText = Locales.deck.reset.error.translate(context);
    final snackBarSuccessText = Locales.deck.reset.success.translate(context);

    final bool? confirm = await showDialog(
      context: context,
      builder: (dialogContext) => ShabadConfirmationDialog(
        titleKey: Locales.deck.reset.title,
        bodyKey: Locales.deck.reset.body,
        cancelKey: Locales.core.cancel,
        confirmKey: Locales.core.confirm,
      ),
    );

    if (confirm != true) return;

    if (words == null) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(snackBarErrorText),
        ),
      );
      return;
    }
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(snackBarSuccessText),
      ),
    );
    return deckCubit.restart(words);
  }
}
