import 'package:flutter/material.dart';

import '../../../../../core/theme/theme.dart';
import '../../../../../core/utils/validators.dart';
import 'build_rule_widget.dart';

class PasswordValidationRulesWidget extends StatelessWidget {
  const PasswordValidationRulesWidget({super.key, required this.password});

  final String password;

  @override
  Widget build(final BuildContext context) {
    final PasswordRequirements req = PasswordRequirements.check(password);


    if (password.isEmpty || req.isAllMet) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.info_outline,
                size: 14,
                color: context.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'PASSWORD REQUIREMENTS',
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.colorScheme.primary,
                  fontSize: 10,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const Divider(height: 20),
          BuildRuleWidget(
            text: 'At least 8 characters',
            isMet: req.hasMinLength,
          ),
          BuildRuleWidget(
            text: 'One uppercase letter',
            isMet: req.hasUppercase,
          ),
          BuildRuleWidget(text: 'One number', isMet: req.hasDigits),
          BuildRuleWidget(text: 'One special character', isMet: req.hasSpecial),
        ],
      ),
    );
  }
}
