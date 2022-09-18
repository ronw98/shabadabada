import 'package:flutter/material.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/presentation/extensions/locale_extensions.dart';
import 'package:shabadapp/presentation/widgets/shabad_text_dialog.dart';

class ShabadConfirmationDialog extends StatelessWidget {
  const ShabadConfirmationDialog({
    Key? key,
    required this.titleKey,
    required this.bodyKey,
    required this.confirmKey,
    required this.cancelKey,
  }) : super(key: key);

  final String titleKey;
  final String bodyKey;
  final String confirmKey;
  final String cancelKey;

  @override
  Widget build(BuildContext context) {
    return ShabadTextDialog(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 12,
          bottom: 4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleKey.translate(context),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: Fonts.berlinSansMedium,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              bodyKey.translate(context),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    cancelKey.translate(context),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: Fonts.berlinSansMedium,
                        ),
                  ),
                ),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    confirmKey.translate(context),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontFamily: Fonts.berlinSansMedium,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
