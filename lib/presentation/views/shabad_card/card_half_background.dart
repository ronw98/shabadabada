import 'package:flutter/material.dart';
import 'package:shabadapp/presentation/theme/colors.dart';
import 'package:shabadapp/presentation/widgets/gradient_mask_widget.dart';

class CardHalfBackground extends StatelessWidget {
  const CardHalfBackground({
    Key? key,
    required this.gradient,
    required this.alignment,
  }) : super(key: key);

  final Gradient gradient;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return GradientMaskWidget(
      gradient: gradient,
      child: FractionallySizedBox(
        alignment: alignment,
        heightFactor: 0.5,
        child: Container(
          color: ShabadColors.white,
        ),
      ),
    );
  }
}
