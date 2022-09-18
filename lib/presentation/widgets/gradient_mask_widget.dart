import 'package:flutter/material.dart';

class GradientMaskWidget extends StatelessWidget {
  const GradientMaskWidget({
    Key? key,
    required this.child,
    required this.gradient,
  }) : super(key: key);

  final Widget child;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    if(gradient == null) {
      return child;
    }
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient!.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
