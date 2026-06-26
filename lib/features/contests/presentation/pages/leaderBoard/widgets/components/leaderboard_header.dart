import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';


class LeaderboardHeader extends StatelessWidget {
  const LeaderboardHeader({super.key, required this.contestId});

  final String contestId;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,

      children: <Widget>[
        //leading
        ArrowBackButton(
          function: () {
            context.pop();
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
        IconButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          iconSize: 30,
          icon: FaIcon(
            FontAwesomeIcons.house,
            color: context.colorScheme.surface,
          ),
        ),
      ],
    );
  }
}
