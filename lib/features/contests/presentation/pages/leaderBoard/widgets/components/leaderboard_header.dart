import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';

class LeaderboardHeader extends StatelessWidget {
  const LeaderboardHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,

      children: <Widget>[
        //leading
        ArrowBackButton(
          function: () {
            context.go(AppRoutes.contestResults);
          },
          size: 30,
          color: context.colorScheme.surface,
        ),
        // title
        Text(
          'Leader Board',
          style: context.textTheme.displayLarge!.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
        // trailing
        ArrowBackButton(
          function: () {
            context.go(AppRoutes.home);
          },
          size: 30,
        ),
      ],
    );
  }
}
