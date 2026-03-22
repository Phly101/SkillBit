import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/contest_details_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';

class StartIn extends StatelessWidget {
  const StartIn({super.key});

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: <Widget>[
         Expanded(child: Divider(thickness: 1, endIndent: 10, indent: 40,
         color: context.colorScheme.outline,
        )),
        Text(
        ContestStrings.startsIn,
          style:context.textTheme.displayMedium?.copyWith(color: context.colorScheme.onSurface),
        ),
        Expanded(child: Divider(thickness: 1, indent: 10, endIndent: 40,
        color: context.colorScheme.outline
        )),
      ],
    );
  }
}
