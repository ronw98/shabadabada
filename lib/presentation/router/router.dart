import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shabadabada/core/injection.dart';
import 'package:shabadabada/presentation/pages/game_page/game_page.dart';
import 'package:shabadabada/presentation/pages/home_page/home_page.dart';
import 'package:shabadabada/presentation/router/route_names.dart';

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
  }
}
