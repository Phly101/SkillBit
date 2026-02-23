import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({required this.pageName, this.pageTitle, super.key});

  final String? pageTitle;
  final String pageName;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        Text(pageName, style: context.textTheme.displayLarge),
        50.heightBox,
        if (pageTitle != null) ...<Widget>[
          Text(
            pageTitle!,
            style: context.textTheme.displayMedium!.copyWith(
              fontSize: 20,
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w900,
            ),
          ),
          45.heightBox,
        ] else ...<Widget>[50.heightBox],
      ],
    );
  }
}
