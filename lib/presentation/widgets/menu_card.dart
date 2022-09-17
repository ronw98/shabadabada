import 'package:flutter/material.dart';
import 'package:shabadapp/assets.dart';
import 'package:shabadapp/presentation/theme/colors.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 15 / 9,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
              gradient: ShabadColors.yellowPinkGradient,
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontSize: 30,
                  fontFamily: Fonts.berlinSansMedium,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
