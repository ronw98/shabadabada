import 'package:flutter/widgets.dart';
import 'package:shabadapp/presentation/extensions/string_utils.dart';
import 'package:shabadapp/presentation/widgets/gradient_mask_widget.dart';

class ShabadCardLabel extends StatelessWidget {
  const ShabadCardLabel({
    Key? key,
    required this.alignment,
    required this.gradient,
    required this.label,
    this.style,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final Alignment alignment;
  final Gradient gradient;
  final String label;
  final TextStyle? style;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GradientMaskWidget(
      gradient: gradient,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        alignment: alignment,
        child: Padding(
          padding: padding,
          child: Center(
            child: Text(
              label.capitalize,
              textAlign: TextAlign.center,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
