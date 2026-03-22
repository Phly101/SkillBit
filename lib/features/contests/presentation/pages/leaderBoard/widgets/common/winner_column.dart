import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class WinnerColumn extends StatelessWidget {
  const WinnerColumn({
    super.key,
    required this.name,
    required this.score,
    required this.child,
    this.isProfile = false,
  });

  final String name;
  final int score;
  final Widget child;
  final bool isProfile;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        child,
        const SizedBox(height: 10),
        Text(
          name,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium!.copyWith(
            fontWeight: .w700,
            color: isProfile
                ? context.colorScheme.outline
                : context.colorScheme.surface,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '$score point',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium!.copyWith(
            fontWeight: .w700,
            color: context.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
