import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/home_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import '../../../../core/utils/assets.dart';
import '../../../profile/presentation/pages/profile_page/widgets/common/drawer_widget.dart';


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
      drawer: navigationShell.currentIndex == 3 ? const DrawerWidget() : null,
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
