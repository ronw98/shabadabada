import 'package:flutter/material.dart';

class ShabadCardShape extends StatelessWidget {
  const ShabadCardShape({
    Key? key,
    required this.child,
    this.elevation = 4,
  }) : super(key: key);
  final Widget child;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 15,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // side:const BorderSide(color: Colors.grey),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: elevation,
        child: child,
      ),
    );
  }
}
