import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/home_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';

import '../../../profile/presentation/widgets/common/drawer_widget.dart';

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
      drawer:  navigationShell.currentIndex == 3?  const DrawerWidget(): null,
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
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: HomeStrings.home,
              ),
              BottomNavigationBarItem(
                icon: FaIcon(Icons.calendar_month),
                label: HomeStrings.myAgenda,
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.book),
                label: HomeStrings.library,
              ),
              BottomNavigationBarItem(
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
