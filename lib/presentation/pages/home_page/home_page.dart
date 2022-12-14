import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shabadapp/jsons.dart';
import 'package:shabadapp/presentation/extensions/locale_extensions.dart';
import 'package:shabadapp/presentation/managers/deck_cubit.dart';
import 'package:shabadapp/presentation/managers/words_cubit.dart';
import 'package:shabadapp/presentation/router/route_names.dart';
import 'package:shabadapp/presentation/router/router.dart';
import 'package:shabadapp/presentation/views/app_bar.dart';
import 'package:shabadapp/presentation/widgets/error_widget.dart';
import 'package:shabadapp/presentation/widgets/menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShabadAppBar(
        translationKey: Locales.core.app_name,
        actions: [
          IconButton(
            onPressed: () => goTo(RouteNames.settings),
            icon: const Icon(Icons.music_note),
          ),
        ],
      ),
      body: BlocBuilder<WordsCubit, WordsState>(
        buildWhen: (previous, next) => previous.runtimeType != next.runtimeType,
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (words) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuCard(
                  label: Locales.home.quick_game.translate(context),
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
