import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shabadapp/core/injection.dart';
import 'package:shabadapp/presentation/pages/game_page/game_page.dart';
import 'package:shabadapp/presentation/pages/home_page/home_page.dart';
import 'package:shabadapp/presentation/pages/privacy_policy/privacy_policy_page.dart';
import 'package:shabadapp/presentation/pages/settings/settings_page.dart';
import 'package:shabadapp/presentation/router/route_names.dart';

goTo(RouteNames route) {
  sl<GlobalKey<NavigatorState>>().currentState?.pushNamed(route.name);
}

Route? generateRoute(RouteSettings settings) {
  final name = settings.name;

  final routeName = RouteNames.values.firstWhereOrNull((r) => r.name == name);
  if (routeName == null) {
    return null;
  }

  switch (routeName) {
    case RouteNames.home:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case RouteNames.game:
      return MaterialPageRoute(builder: (context) => const GamePage());
    case RouteNames.settings:
      return MaterialPageRoute(builder: (context) => const SettingsPage());
    case RouteNames.privacy:
      return MaterialPageRoute(builder: (context) => const PrivacyPolicyPage());
  }
}
