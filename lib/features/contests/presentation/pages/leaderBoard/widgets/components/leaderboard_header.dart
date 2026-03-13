import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';

class LeaderboardHeader extends StatelessWidget {
  const LeaderboardHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,

      children: <Widget>[
        //leading
        IconButton(
          onPressed: //Todo: Implement Function logic
          () {
            context.go(AppRoutes.contestResults);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            fontWeight: .bold,
            color: Colors.white,
          ),
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
          onPressed: //Todo: Implement Function logic
          () {
            context.go(AppRoutes.home);
          },
          icon: FaIcon(
            FontAwesomeIcons.house,
            color: context.colorScheme.surface,
          ),
        ),
      ],
    );
  }
}
