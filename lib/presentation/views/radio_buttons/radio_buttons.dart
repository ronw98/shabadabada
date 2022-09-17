import 'package:flutter/material.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/presentation/theme/colors.dart';
import 'package:shabadapp/presentation/widgets/card_label.dart';
import 'package:shabadapp/presentation/widgets/card_shape.dart';
import 'package:shabadapp/presentation/widgets/gradient_mask_widget.dart';

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
            child: ShabadCardShape(
              aspectRatio: 15 / 9,
              child: InkWell(
                onTap: () => onItemTap(option),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GradientMaskWidget(
                        gradient: backgroundGradient,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: ShabadCardLabel(
                        label: itemToString(option),
                        gradient: textGradient,
                        alignment: Alignment.center,
                        style: const TextStyle(
                          fontFamily: Fonts.berlinSansRegular,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
