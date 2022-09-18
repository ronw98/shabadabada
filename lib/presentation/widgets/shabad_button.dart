import 'package:flutter/material.dart';
import 'package:shabadapp/presentation/theme/button_style.dart';
import 'package:shabadapp/presentation/theme/colors.dart';
import 'package:shabadapp/presentation/widgets/card_shape.dart';
import 'package:shabadapp/presentation/widgets/gradient_mask_widget.dart';

class ShabadButton extends StatelessWidget {
  const ShabadButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.style,
    this.elevation = 4,
  }) : super(key: key);

  final Function() onTap;
  final Widget child;
  final double elevation;
  final ShabadButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final themeStyle = Theme.of(context).extension<ShabadButtonStyle>();

    final resultStyle = themeStyle?.copyWith(
      backgroundGradient: style?.backgroundGradient,
      textGradient: style?.textGradient,
    );

    return ShabadCardShape(
      aspectRatio: 15 / 9,
      elevation: elevation,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: GradientMaskWidget(
                gradient: resultStyle?.backgroundGradient,
                child: Container(
                  color: resultStyle?.backgroundGradient == ShabadColors.noGradient
                      ? Colors.transparent
                      : Colors.white,
                ),
              ),
            ),
            Positioned.fill(
              child: GradientMaskWidget(
                gradient: resultStyle?.textGradient,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
