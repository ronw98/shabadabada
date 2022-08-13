import 'package:flutter/material.dart';
import 'package:shabadabada/presentation/widgets/card_shape.dart';

class ShabadCardBack extends StatelessWidget {
  const ShabadCardBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShabadCardShape(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Back card placeholder',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Back card placeholder',
                style: TextStyle(
                  color: Colors.white,
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
