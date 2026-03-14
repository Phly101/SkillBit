import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/app_colors.dart';

class GradientOverlay extends StatelessWidget {
  const GradientOverlay({super.key});

  @override
  Widget build(final BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const <double>[0.5, 0.95],
            colors: <Color>[
              Colors.transparent,
              AppColors.surface.withValues(alpha: 0.9),
            ],
          ),
        ),
      ),
    );
  }
}
