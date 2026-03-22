import 'package:flutter/material.dart';
import '../../../../../../../core/widgets/global/drawer_widget.dart';

class CourseDrawer extends StatelessWidget {
  const CourseDrawer({super.key, required this.drawerItems});

  final List<Widget> drawerItems;

  @override
  Widget build(final BuildContext context) {
    return DrawerWidget(drawerItems: drawerItems);
  }
}
