import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shabadabada/core/injection.config.dart';

final sl = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

@InjectableInit()
void configureDependencies() => $initGetIt(sl);

void setUpInjector() {
  configureDependencies();
  sl.registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
}