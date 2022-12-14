import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shabadapp/core/injection.dart';
import 'package:shabadapp/core/locale/locale_helper.dart';
import 'package:shabadapp/presentation/managers/deck_cubit.dart';
import 'package:shabadapp/presentation/managers/words_cubit.dart';
import 'package:shabadapp/presentation/router/route_names.dart';
import 'package:shabadapp/presentation/router/router.dart';
import 'package:shabadapp/presentation/theme/theme.dart';

class ShabadApp extends StatelessWidget {
  const ShabadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeckCubit>.value(
          value: sl<DeckCubit>(),
        ),
        BlocProvider.value(
          value: sl<WordsCubit>()..loadWords(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: ShabadI18n.supportedLocales,
        localeListResolutionCallback: ShabadI18n.localeListResolutionCallback,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        localizationsDelegates: [
          ShabadI18n.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        navigatorKey: sl(),
        onGenerateRoute: generateRoute,
        initialRoute: RouteNames.home.name,
      ),
    );
  }
}
