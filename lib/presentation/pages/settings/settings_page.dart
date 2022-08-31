import 'package:flutter/material.dart';
import 'package:shabadapp/jsons.dart';
import 'package:shabadapp/presentation/extensions/locale_extensions.dart';
import 'package:shabadapp/presentation/router/route_names.dart';
import 'package:shabadapp/presentation/router/router.dart';
import 'package:shabadapp/presentation/views/app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShabadAppBar(translationKey: Locales.settings.title),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Locales.settings.credits.title.translate(context),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      Locales.settings.credits.body.translate(context),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                icon: const Icon(Icons.privacy_tip),
                label: Text(
                  Locales.settings.privacy.translate(context),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                onPressed: () => goTo(RouteNames.privacy),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
