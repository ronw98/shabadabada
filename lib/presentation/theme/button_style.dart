import 'package:flutter/material.dart';

class ShabadButtonStyle extends ThemeExtension<ShabadButtonStyle> {
  final Gradient? backgroundGradient;
  final Gradient? textGradient;

  ShabadButtonStyle({required this.backgroundGradient, required this.textGradient});

  @override
  ShabadButtonStyle copyWith({
    Gradient? backgroundGradient,
    Gradient? textGradient,
  }) =>
      ShabadButtonStyle(
        backgroundGradient: backgroundGradient ?? this.backgroundGradient,
        textGradient: textGradient ?? this.textGradient,
      );

  @override
  ShabadButtonStyle lerp(ThemeExtension<ShabadButtonStyle>? other, double t) {
    if (other is! ShabadButtonStyle) {
      return this;
    }
    return ShabadButtonStyle(
      textGradient: Gradient.lerp(
        textGradient,
        other.textGradient,
        t,
      ),
      backgroundGradient: Gradient.lerp(
        backgroundGradient,
        other.backgroundGradient,
        t,
      ),
    );
  }
}