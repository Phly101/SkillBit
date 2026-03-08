import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/app_colors.dart';
import 'package:skill_bit/core/widgets/gradiant_container.dart';

class LockedCard extends StatelessWidget {

  const LockedCard({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(final BuildContext context) {
    return ShaderMask(
      shaderCallback: (final Rect rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColors.textMain.withValues(alpha: 0.75),
            AppColors.surface,
          ],
          stops: const <double>[0.72, 1.0], 
        ).createShader(rect);
      },
      blendMode: BlendMode.srcIn, 
      child: GradiantContainer(
        width: 127,
        height: 127,
        radius: 100,
        child: Center(
          
          child: Image.asset(imagePath, width:100, height: 100, fit: BoxFit.contain)),
      ),
    );
  }
}
