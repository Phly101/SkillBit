import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/app_colors.dart';

class LockedCard extends StatelessWidget {

   LockedCard({
    super.key,
    final Color? iconColor,
    final Color? backgroundColor,
    required this.imagePath,
  }) : iconColor = iconColor ?? AppColors.textMain.withValues(alpha: .25),
       backgroundColor = backgroundColor ?? AppColors.surface;
  final Color iconColor;
  final Color backgroundColor;
  final String imagePath;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: 127,
      height: 127,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // خلفية الدائرة
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.textMain.withValues(alpha: 0.75), // لون خلفية خفيف
            ),
          ),

          // أيقونة الدرع
          Icon(Icons.shield, size: 100, color: iconColor),

          // طبقة التلاشي (Gradient Overlay)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops:  const <double>[0.5, 0.95],
                  colors: <Color>[
                    Colors.transparent,
                    backgroundColor.withValues(alpha: 0.9),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
