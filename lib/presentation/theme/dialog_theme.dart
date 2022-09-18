import 'package:flutter/material.dart';

class ShabadDialogTheme extends ThemeExtension<ShabadDialogTheme> {
  final Gradient? backgroundGradient;
  final Gradient? textGradient;

  ShabadDialogTheme({required this.backgroundGradient, required this.textGradient});

  @override
  ShabadDialogTheme copyWith({
    Gradient? backgroundGradient,
    Gradient? textGradient,
  }) =>
      ShabadDialogTheme(
        backgroundGradient: backgroundGradient ?? this.backgroundGradient,
        textGradient: textGradient ?? this.textGradient,
      );

  @override
  ShabadDialogTheme lerp(ThemeExtension<ShabadDialogTheme>? other, double t) {
    if (other is! ShabadDialogTheme) {
      return this;
    }
    return ShabadDialogTheme(
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
