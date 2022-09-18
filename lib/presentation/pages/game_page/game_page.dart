import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shabadapp/jsons.dart';
import 'package:shabadapp/presentation/managers/deck_cubit.dart';
import 'package:shabadapp/presentation/views/app_bar.dart';
import 'package:shabadapp/presentation/views/shabad_deck_widget/deck_widget.dart';
import 'package:shabadapp/presentation/widgets/none_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.7;
    return Scaffold(
      appBar: ShabadAppBar(translationKey: Locales.core.app_name),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<DeckCubit, DeckState>(
            buildWhen: (previous, next) =>
                previous.runtimeType != next.runtimeType,
            builder: (context, state) {
              return state.maybeMap(
                loaded: (_) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
                  child: ShabadDeckWidget(cardWidth:width),
                ),
                orElse: () => const NoneWidget(),
              );
            },
          ),
        ),
      ),
    );
  }
}
