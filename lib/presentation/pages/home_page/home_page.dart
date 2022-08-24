import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shabadabada/jsons.dart';
import 'package:shabadabada/presentation/extensions/locale_extensions.dart';
import 'package:shabadabada/presentation/managers/deck_cubit.dart';
import 'package:shabadabada/presentation/managers/words_cubit.dart';
import 'package:shabadabada/presentation/router/route_names.dart';
import 'package:shabadabada/presentation/router/router.dart';
import 'package:shabadabada/presentation/views/app_bar.dart';
import 'package:shabadabada/presentation/widgets/error_widget.dart';
import 'package:shabadabada/presentation/widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShabadAppBar(translationKey: Locales.core.app_name),
      body: BlocBuilder<WordsCubit, WordsState>(
        buildWhen: (previous, next) => previous.runtimeType != next.runtimeType,
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (words) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuCard(
                  label:
                  Locales.home.quick_game.translate(context),
                  onTap: () {
                    BlocProvider.of<DeckCubit>(context).loadDeck(words);
                    goTo(RouteNames.game);
                  },
                ),
              ],
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            orElse: () => const Center(child: ErrorPlaceHolderWidget()),
          );
        },
      ),
    );
  }
}
