import 'package:flutter/material.dart';
import 'package:shabadapp/app_constants.dart';
import 'package:shabadapp/presentation/extensions/locale_extensions.dart';

class ShabadAppBar extends StatelessWidget with PreferredSizeWidget {
  const ShabadAppBar({
    Key? key,
    required this.translationKey,
  }) : super(key: key);
  final String translationKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        translationKey.translate(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        ShabadAppConstants.appBarHeight,
      );
}
