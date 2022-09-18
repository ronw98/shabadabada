import 'package:flutter/material.dart';

class ShabadCardShape extends StatelessWidget {
  const ShabadCardShape({
    Key? key,
    required this.child,
    this.elevation = 4,
    this.aspectRatio,

  }) : super(key: key);
  final Widget child;
  final double elevation;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    final widget = Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        // side:const BorderSide(color: Colors.grey),
      ),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      elevation: elevation,
      child: child,
    );
    if(aspectRatio == null) {
      return widget;
    }
    return AspectRatio(
      aspectRatio: aspectRatio!,
      child: widget,
    );
  }
}
