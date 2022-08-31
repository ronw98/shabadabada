import 'package:flutter/material.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/presentation/theme/colors.dart';

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
);
