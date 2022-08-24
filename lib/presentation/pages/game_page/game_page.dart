import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shabadabada/jsons.dart';
import 'package:shabadabada/presentation/managers/deck_cubit.dart';
import 'package:shabadabada/presentation/views/app_bar.dart';
import 'package:shabadabada/presentation/widgets/deck_widget.dart';
import 'package:shabadabada/presentation/widgets/none_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.7;
    return Scaffold(
      appBar: ShabadAppBar(translationKey: Locales.core.app_name),
      body: Center(
        child: SizedBox(
          width: width,
          child: BlocBuilder<DeckCubit, DeckState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (deck) => ShabadDeckWidget(deck: deck),
                orElse: () => const NoneWidget(),
              );
            },
          ),
        ),
      ),
    );
  }
}
