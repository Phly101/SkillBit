import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/app_colors.dart';
import 'package:skill_bit/features/profile/presentation/widgets/common/badge_common/background_circle.dart';
import 'package:skill_bit/features/profile/presentation/widgets/common/badge_common/gradient_overlay.dart';

class LockedCard extends StatelessWidget {
  const LockedCard({super.key});

 

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: 127,
      height:127,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const BackgroundCircle(),
          Icon(
            Icons.shield,
            size: 100,
            color: AppColors.textMain.withValues(alpha: 0.25),
          ),
          const GradientOverlay(),
        ],
      ),
    );
  }
}



