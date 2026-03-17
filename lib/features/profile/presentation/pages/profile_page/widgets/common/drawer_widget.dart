import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import '../../../../../../../core/constants/profile_strings.dart';
import '../../../../../../../core/utils/global/assets.dart';
import 'nav_tile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // badges button
          NavTileWidget(
            title: ProfileStrings.badges,
            isIcon: false,
            imageUrl: Assets.icon('shield_icon.png'),
            scale: 15,
            function: //Todo: Implement Function logic
            () {
              context.pop();
              context.pushNamed(AppRoutes.badges);
            },
          ),
          // Achievement button
          NavTileWidget(
            title: ProfileStrings.achievement,
            isIcon: false,
            imageUrl: Assets.icon('trophy_icon.png'),
            scale: 15,
            function: //Todo: Implement Function logic
            () {
              context.pop();
              context.pushNamed(AppRoutes.achievement);
            },
          ),
          // friends page button
          NavTileWidget(
            title: ProfileStrings.friends,
            isIcon: true,
            icon: FontAwesomeIcons.userGroup,
            scale: 15,
            function: //Todo: Implement Function logic
            () {
              context.pop();
              context.pushNamed(AppRoutes.friends);
            },
          ),
          const Spacer(),
          // About us button
          NavTileWidget(
            title: ProfileStrings.aboutUs,
            isIcon: true,
            icon: Icons.person,
            size: 30,
            function: //Todo: Implement Function logic
            () {
              context.pop();
              context.pushNamed(AppRoutes.aboutUs);
            },
          ),
          // contact us button
          NavTileWidget(
            title: ProfileStrings.contactUs,
            isIcon: true,
            icon: FontAwesomeIcons.phone,
            function: //Todo: Implement Function logic
            () {
              context.pop();
              context.pushNamed(AppRoutes.contactUs);
            },
          ),
          // settings button
          NavTileWidget(
            title: ProfileStrings.settings,
            isIcon: true,
            icon: FontAwesomeIcons.gear,
            function: //Todo: Implement Function logic
            () {
              context.pop();
              context.pushNamed(AppRoutes.settings);
            },
          ),
          100.heightBox,
        ],
      ).pH(10).pV(80),
    );
  }
}
