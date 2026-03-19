import 'package:flutter/material.dart';
import '../../../../../core/theme/theme.dart';

class StatusContainer extends StatelessWidget {
  const StatusContainer({super.key, required this.isLocked});

  final bool isLocked;

  @override
  Widget build(final BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(30),
        color: context.colorScheme.secondary.withValues(alpha: 0.3),
      ),
      child: Text(
        isLocked ? 'Locked' : 'Active',
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.primary,
        ),
      ).pH(8),
    );
  }
}
