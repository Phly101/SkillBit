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
    return Scaffold(
      body: navigationShell,
      drawer:
          navigationShell.currentIndex == 2
              ? const _MainProfileDrawer()
              : null,
      bottomNavigationBar: _MainBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

class _MainProfileDrawer extends StatelessWidget {
  const _MainProfileDrawer();

  @override
  Widget build(final BuildContext context) {
    return DrawerWidget(
      isPadded: true,
      drawerItems: <Widget>[
        // badges button
        NavTileWidget(
          title: ProfileStrings.badges,
          isIcon: false,
          imageUrl: Assets.icon('shield_icon.png'),
          scale: 15,
          function: () {
            context.pop();
            context.pushNamed(AppRoutes.badges);
          },
        ),
        // Achievement button
        NavTileWidget(
          title: ProfileStrings.achievement,
          isIcon: false,
          imageUrl: Assets.icon('locked_trophy_icon.png'),
          scale: 15,
          function: () {
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
          function: () {
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
          function: () {
            context.pop();
            context.pushNamed(AppRoutes.aboutUs);
          },
        ),
        // contact us button
        NavTileWidget(
          title: ProfileStrings.contactUs,
          isIcon: true,
          icon: FontAwesomeIcons.phone,
          function: () {
            context.pop();
            context.pushNamed(AppRoutes.contactUs);
          },
        ),
        // settings button
        NavTileWidget(
          title: ProfileStrings.settings,
          isIcon: true,
          icon: FontAwesomeIcons.gear,
          function: () {
            context.pop();
            context.pushNamed(AppRoutes.settings);
          },
        ),
        100.heightBox,
      ],
    );
  }
}

class _MainBottomNavBar extends StatelessWidget {
  const _MainBottomNavBar({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(final BuildContext context) {
    final bool isContestActive = currentIndex == 1;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Divider(
          height: 1,
          thickness: 1,
          color: context.colorScheme.onSurface.withValues(alpha: 0.4),
        ),
        BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: HomeStrings.home,
            ),
            // const BottomNavigationBarItem(
            //   icon: FaIcon(Icons.calendar_month),
            //   label: HomeStrings.myAgenda,
            // ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                isContestActive
                    ? Assets.icon('contest_icon_activated.svg')
                    : Assets.icon('contest_icon_inactive.svg'),
                width: isContestActive ? 40 : 25,
                height: isContestActive ? 40 : 25,
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
    );
  }
}
