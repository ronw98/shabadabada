import 'package:flutter/material.dart';

class ShabadColors {
  const ShabadColors._();

  static const primaryBlue = Color(0xFF235779);
  static const secondaryPink = Color(0xFFFFB3DC);
  static const tertiaryYellow = Color(0xFFFBD640);

  static const white = Color(0xFFFFF3FF);
  static const lightBlue = Color(0xFF3A6E91);
  static const darkBlue = Color(0xFF003655);

  static const yellowPinkGradient = LinearGradient(
    colors: [tertiaryYellow, secondaryPink],
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
  );

  static const blueGradient = LinearGradient(
    colors: [lightBlue, darkBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const noGradient = LinearGradient(
    colors: [
      Colors.transparent,
      Colors.transparent,
    ],
  );
}
