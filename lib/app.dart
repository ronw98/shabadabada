import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shabadabada/core/locale/locale_helper.dart';
import 'package:shabadabada/presentation/pages/home_page/home_page.dart';

class ShabadApp extends StatelessWidget {
  const ShabadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: ShabadI18n.supportedLocales,
      localeListResolutionCallback: ShabadI18n.localeListResolutionCallback,
      localizationsDelegates: [
        ShabadI18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const MyHomePage(title: 'ShabadApp'),
    );
  }
}
