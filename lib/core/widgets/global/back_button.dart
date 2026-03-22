import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
    required this.function,
    this.size = 25,
    this.color,
  });

  final void Function()? function;
  final double? size;
  final Color? color;

  @override
  Widget build(final BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: size,
        fontWeight: FontWeight.bold,
        color: color ?? context.colorScheme.onSurface,
      ),
      onPressed: function,
    );
  }
}
