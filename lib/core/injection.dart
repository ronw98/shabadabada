import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shabadabada/core/injection.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(sl);
