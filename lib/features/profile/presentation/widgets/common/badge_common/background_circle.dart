import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/app_colors.dart';

class BackgroundCircle extends StatelessWidget {
  const BackgroundCircle({super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.textMain.withValues(alpha: 0.75),
      ),
    );
  }
}
