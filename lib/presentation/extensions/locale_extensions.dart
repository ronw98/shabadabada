import 'package:flutter_i18n/flutter_i18n.dart';

extension LocaleExt on String {
  String translate(context) => FlutterI18n.translate(context, this);
}