import 'package:flutter/material.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/presentation/theme/colors.dart';

final theme = ThemeData(
  fontFamily: Fonts.berlinSansRegular,
  colorScheme: ColorScheme.fromSeed(
    seedColor: ShabadColors.primaryBlue,
    primary: ShabadColors.primaryBlue,
    secondary: ShabadColors.secondaryPink,
    onSecondary: ShabadColors.darkBlue,
    tertiary: ShabadColors.tertiaryYellow,
    onTertiary: ShabadColors.primaryBlue,
  ),
);
