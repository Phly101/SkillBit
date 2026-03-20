import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:skill_bit/core/theme/theme.dart';

class GradiantContainer extends StatelessWidget {
  const GradiantContainer({
    super.key,
    this.child,
    this.radius,
    this.width,
    this.height,
    this.image,
    this.begin = .topCenter,
    this.end = .centerEnd,
    this.inverted = false,
    this.doAllTakeBorder = true,
    this.borderRadius,
    this.topRight = 0,
    this.topLeft = 0,
    this.bottomRight = 0,
    this.bottomLeft = 0,
    this.border,
  });

  final Widget? child;
  final double? radius;
  final double? width;
  final double? height;
  final String? image;
  final bool inverted;
  final double topRight;
  final double topLeft;
  final double bottomRight;
  final double bottomLeft;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final bool doAllTakeBorder;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: border,
        borderRadius: doAllTakeBorder
            ? .circular(radius ?? 0)
            : .only(
          topRight: .circular(topRight),
          topLeft: .circular(topLeft),
          bottomLeft: .circular(bottomLeft),
          bottomRight: .circular(bottomRight),
        ),
        image: image != null
            ? DecorationImage(image: Svg(image!), opacity: 0.4, fit: .fill)
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
          begin: begin,
          end: end,
        ),
      ),
      child: child,
    );
  }
}
