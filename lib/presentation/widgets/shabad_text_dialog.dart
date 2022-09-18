import 'package:flutter/material.dart';
import 'package:shabadapp/presentation/theme/dialog_theme.dart';
import 'package:shabadapp/presentation/widgets/card_shape.dart';
import 'package:shabadapp/presentation/widgets/gradient_mask_widget.dart';

class ShabadTextDialog extends StatelessWidget {
  const ShabadTextDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ShabadDialogTheme? theme =
        Theme.of(context).extension<ShabadDialogTheme>();
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ShabadCardShape(
        child: Stack(
          children: [
            Positioned.fill(
              child: GradientMaskWidget(
                gradient: theme?.backgroundGradient,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            GradientMaskWidget(
              gradient: theme?.textGradient,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
