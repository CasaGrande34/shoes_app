import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final Curve curve;

  const ShakeTransition({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 900),
    this.offset   = 140.0,
    this.axis     = Axis.horizontal, 
    this.curve    = Curves.elasticOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 0.0),
        curve: curve,
        child: child,
        duration: duration,
        builder: (context, valor, child) {
          return Transform.translate(
              offset: axis == Axis.horizontal
                  ? Offset(valor * offset, 0.0)
                  : Offset(0.0, valor * offset),
              child: child);
        });
  }
}
