import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:skill_bit/core/theme/theme.dart';

class GradiantContainer extends StatelessWidget {
  const GradiantContainer({
    super.key,
    required this.child,
    this.radius,
    this.width,
    this.height,
    this.image,
    this.begin = .topCenter,
    this.end = .centerEnd,
    this.inverted = false,
  });

  final Widget child;
  final double? radius;
  final double? width;
  final double? height;
  final String? image;
  final bool inverted;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        image: image != null
            ? DecorationImage(
                image: Svg(
                  image!,
                ),
                opacity: 0.4,
                fit: .fill,
              )
            : null,
        gradient: inverted
            ? LinearGradient(
                colors: <Color>[
                  context.colorScheme.secondary,
                  context.colorScheme.primary.withValues(alpha: 0.8),
                  context.colorScheme.primary,
                ],
                begin: begin,
                end: end,
              )
            : LinearGradient(
                colors: <Color>[
                  context.colorScheme.primary,
                  context.colorScheme.primary.withValues(alpha: 0.8),
                  context.colorScheme.secondary,
                ],
              ),
      ),
      child: child,
    );
  }
}
