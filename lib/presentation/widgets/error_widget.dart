import 'package:flutter/material.dart';
import 'package:shabadapp/jsons.dart';
import 'package:shabadapp/presentation/extensions/locale_extensions.dart';

class ErrorPlaceHolderWidget extends StatelessWidget {
  const ErrorPlaceHolderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.close_rounded,
          color: Color(0xFFBD0D00),
          size: 40,
        ),
        Text(
          Locales.core.error.translate(context),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
