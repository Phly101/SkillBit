import 'package:flutter/material.dart';
import '../../../../../core/theme/theme.dart';

class StatusContainer extends StatelessWidget {
  const StatusContainer({
    super.key,
    required this.isLocked,
    required this.progress,
  });

  final bool isLocked;
  final double progress;

  @override
  Widget build(final BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(30),
        color: context.colorScheme.secondary.withValues(alpha: 0.3),
      ),
      //Todo: will be changed when the enrollment type be added to the course entity
      child: Text(
        isLocked
            ? 'Locked'
            : (progress == 1.0)
            ? 'Finished'
            : 'Active',
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.primary,
        ),
      ).pH(8),
    );
  }
}
