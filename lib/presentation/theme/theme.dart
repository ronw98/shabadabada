import 'package:flutter/material.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/presentation/theme/button_style.dart';
import 'package:shabadapp/presentation/theme/colors.dart';
import 'package:shabadapp/presentation/theme/dialog_theme.dart';

const textTheme = TextTheme(
  bodyLarge: TextStyle(fontSize: 18),
);

final lightTheme = ThemeData(
  fontFamily: Fonts.berlinSansRegular,
  colorScheme: ColorScheme.fromSeed(
    seedColor: ShabadColors.primaryBlue,
    primary: ShabadColors.primaryBlue,
    onPrimary: Colors.white,
    secondary: ShabadColors.secondaryPink,
    onSecondary: ShabadColors.darkBlue,
    tertiary: ShabadColors.tertiaryYellow,
    onTertiary: ShabadColors.primaryBlue,
  ),
  textTheme: textTheme,
  extensions: [
    ShabadDialogTheme(
      backgroundGradient: ShabadColors.yellowPinkGradient,
      textGradient: ShabadColors.blueGradient,
    ),
    ShabadButtonStyle(
        backgroundGradient: ShabadColors.noGradient,
        textGradient: ShabadColors.blueGradient
    ),
  ],
);

final darkTheme = ThemeData(
  fontFamily: Fonts.berlinSansRegular,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: ShabadColors.primaryBlue,
    primary: ShabadColors.primaryBlue,
    onPrimary: Colors.white,
    secondary: ShabadColors.secondaryPink,
    onSecondary: ShabadColors.darkBlue,
    tertiary: ShabadColors.tertiaryYellow,
    onTertiary: ShabadColors.primaryBlue,
  ),
  textTheme: textTheme,
  extensions: [
    ShabadDialogTheme(
      backgroundGradient: ShabadColors.blueGradient,
      textGradient: ShabadColors.yellowPinkGradient,
    ),
    ShabadButtonStyle(
      backgroundGradient: ShabadColors.noGradient,
      textGradient: ShabadColors.yellowPinkGradient
    ),
  ],
);
