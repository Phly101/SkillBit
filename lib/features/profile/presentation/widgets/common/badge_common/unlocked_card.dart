import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/shadow_container.dart';

class UnlockedCard extends StatelessWidget {
  const UnlockedCard({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      blurRadius: 12.0,
      borderRadius:100,
      child: Center(
        child: Image.asset(
          imagePath,
        width: 100,
        height: 100,
          fit: BoxFit.contain,
        ).pNum(16),
      ),
    );
  }
}
