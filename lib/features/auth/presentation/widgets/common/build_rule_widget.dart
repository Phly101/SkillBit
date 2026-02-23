import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/theme/theme.dart';

class BuildRuleWidget extends StatelessWidget {
  const BuildRuleWidget({super.key, required this.text, required this.isMet});

  final String text;
  final bool isMet;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: <Widget>[
        FaIcon(
          isMet ? FontAwesomeIcons.circleCheck : FontAwesomeIcons.circle,
          color: isMet
              ? context.colorScheme.onError
              : context.colorScheme.outline,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: context.textTheme.bodySmall!.copyWith(
            fontSize: 12,
            color: isMet
                ? context.colorScheme.onError
                : context.colorScheme.outline,
          ),
        ),
      ],
    ).pV(2);
  }
}
