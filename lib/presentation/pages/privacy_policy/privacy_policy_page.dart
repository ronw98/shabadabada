import 'package:flutter/material.dart';
import 'package:shabadapp/jsons.dart';
import 'package:shabadapp/presentation/extensions/locale_extensions.dart';
import 'package:shabadapp/presentation/views/app_bar.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShabadAppBar(translationKey: Locales.privacy.title),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                Locales.privacy.body.translate(context),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
