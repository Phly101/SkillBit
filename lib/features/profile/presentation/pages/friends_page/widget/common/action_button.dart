import 'package:flutter/material.dart';

import '../../../../../../../core/theme/theme.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isPrimary = true,
  });

  final String label;
  final bool isPrimary;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: isPrimary
                ? LinearGradient(
                    colors: <Color>[
                      context.colorScheme.primary,
                      context.colorScheme.primary.withValues(alpha: 0.8),
                      context.colorScheme.secondary,
                    ],
              begin: .topCenter,
              end: .bottomCenter,
                  )
                : null,
            borderRadius: BorderRadius.circular(12),
            border: isPrimary
                ? null
                : Border.all(color: context.colorScheme.secondary,width: 2),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isPrimary ? Colors.white : context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
