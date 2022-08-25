import 'package:flutter/material.dart';
import 'package:shabadabada/presentation/theme/colors.dart';
import 'package:shabadabada/presentation/widgets/card_shape.dart';

class ShabadCardBack extends StatelessWidget {
  const ShabadCardBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShabadCardShape(
      child: Container(
        decoration: const BoxDecoration(
          gradient: ShabadColors.yellowPingGradient,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Back card placeholder',
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Back card placeholder',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
