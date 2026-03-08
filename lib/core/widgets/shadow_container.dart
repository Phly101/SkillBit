import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    super.key,
    required this.child,
    this.color = Colors.white,
    this.shape = BoxShape.rectangle,
    this.borderRadius = 4.0,
    this.blurRadius = 10.0,
    this.offset = const Offset(0, 4),
    this.margin,
  });

  final Widget child;
  final Color? color;
  final BoxShape shape;
  final double borderRadius;
  final double blurRadius;
  final Offset offset;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.circular(borderRadius)
            : null,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: blurRadius,
            offset: offset,
          ),
        ],
      ),
      child: child,
    );
  }
}
