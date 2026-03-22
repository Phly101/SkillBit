import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class ResultsPageHeader extends StatelessWidget {
  const ResultsPageHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title, style: context.textTheme.displayLarge),
        const SizedBox(height: 20),
        Text(
          'Great job! Here\'s how you performed',
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.outline.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
