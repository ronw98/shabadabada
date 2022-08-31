import 'package:flutter/material.dart';
import 'package:shabadapp/app_constants.dart';
import 'package:shabadapp/presentation/extensions/locale_extensions.dart';

class ShabadAppBar extends StatelessWidget with PreferredSizeWidget {
  const ShabadAppBar({
    Key? key,
    required this.translationKey,
    this.actions = const [],
  }) : super(key: key);
  final String translationKey;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        translationKey.translate(context),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        ShabadAppConstants.appBarHeight,
      );
}
