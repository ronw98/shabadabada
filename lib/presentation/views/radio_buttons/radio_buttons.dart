import 'package:flutter/material.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/presentation/theme/button_style.dart';
import 'package:shabadapp/presentation/theme/colors.dart';
import 'package:shabadapp/presentation/widgets/shabad_button.dart';

class RadioButtons<T> extends StatelessWidget {
  const RadioButtons({
    Key? key,
    required this.options,
    required this.itemToString,
    required this.onItemTap,
    required this.selected,
  }) : super(key: key);

  final List<T> options;
  final String Function(T item) itemToString;
  final Function(T choice) onItemTap;
  final T selected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: options.map(
        (option) {
          final backgroundGradient = option == selected
              ? ShabadColors.yellowPinkGradient
              : ShabadColors.blueGradient;
          final textGradient = option == selected
              ? ShabadColors.blueGradient
              : ShabadColors.yellowPinkGradient;
          return FractionallySizedBox(
            widthFactor: 0.4,
            child: ShabadButton(
              style: ShabadButtonStyle(
                textGradient: textGradient,
                backgroundGradient: backgroundGradient,
              ),
              onTap: () => onItemTap(option),
              child: Center(
                child: Text(
                  itemToString(option),
                  style: const TextStyle(
                    fontFamily: Fonts.berlinSansRegular,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
