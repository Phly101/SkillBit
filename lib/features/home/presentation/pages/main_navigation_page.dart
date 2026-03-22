import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/home_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import '../../../../core/constants/profile_strings.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/utils/global/assets.dart';
import '../../../../core/widgets/global/drawer_widget.dart';
import '../../../../core/widgets/global/nav_tile_widget.dart';


class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(final int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(final BuildContext context) {
    final bool isActive = navigationShell.currentIndex == 2;
    return Scaffold(
      body: navigationShell,
      drawer: navigationShell.currentIndex == 3 ? DrawerWidget(drawerItems: <Widget>[
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
      ],) : null,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Divider(
            height: 1,
            thickness: 1,
            color: context.colorScheme.onSurface.withValues(alpha: 0.4),
          ),
          BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: _onTap,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: HomeStrings.home,
              ),
              const BottomNavigationBarItem(
                icon: FaIcon(Icons.calendar_month),
                label: HomeStrings.myAgenda,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  isActive
                      ? Assets.icon('contest_icon_activated.svg')
                      : Assets.icon('contest_icon_inactive.svg'),
                  width: isActive ? 40 : 25,
                  height: isActive ? 40 : 25,
                ),
                label: HomeStrings.contest,
              ),
              const BottomNavigationBarItem(
                icon: FaIcon(Icons.person),
                label: HomeStrings.profile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
