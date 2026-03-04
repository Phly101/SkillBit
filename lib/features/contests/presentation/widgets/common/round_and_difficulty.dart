import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class RoundAndDifficulty extends StatelessWidget {
  const RoundAndDifficulty({
    super.key,
    required this.round,
    required this.difficulty, required this.difficultyImagePath,
  });

  final String round;
  final String difficulty;
  final String difficultyImagePath;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          round,
          style: context.textTheme.displayMedium?.copyWith(
            color: context.colorScheme.onSurface,
            fontSize: 18,
          ),
        ),
        Container(
          width: 163,
          height: 31,
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Image.asset(difficultyImagePath, height: 25, width: 25),
              5.widthBox,
              Text(difficulty, style: context.textTheme.displayMedium),
            ],
          ),
        ),
      ],
    ).pH(13).pV(17);
  }
}
