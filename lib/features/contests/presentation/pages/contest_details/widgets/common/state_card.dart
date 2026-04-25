import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.imagePath,
    required this.topText,
    required this.bottomText,
  });

  final String imagePath;
  final String topText;
  final String bottomText;

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      borderRadius: 8,
      blurRadius: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath, height: 40, width: 40),
          4.heightBox,
          Text(
            topText,
            style: context.textTheme.displayMedium?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ).pH(10),
          Text(
            bottomText,
            style: context.textTheme.displayMedium?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ).pH(10),
        ],
      ).pNum(8),
    );
  }
}
