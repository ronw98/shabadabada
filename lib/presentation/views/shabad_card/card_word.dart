import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/domain/entities/word.dart';
import 'package:shabadapp/presentation/extensions/string_utils.dart';
import 'package:shabadapp/presentation/widgets/gradient_mask_widget.dart';

class ShabadCardWord extends StatelessWidget {
  const ShabadCardWord({
    Key? key,
    required this.word,
    required this.gradient,
    required this.alignment,
    required this.rotate,
  }) : super(key: key);

  final Word word;
  final Gradient gradient;
  final Alignment alignment;
  final bool rotate;

  @override
  Widget build(BuildContext context) {
    return GradientMaskWidget(
      gradient: gradient,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Transform.rotate(
            angle: rotate ? pi : 0,
            child: Center(
              child: Text(
                word.word.capitalize,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: Fonts.berlinSansMedium,
                  fontStyle:
                      word.isCategory ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
