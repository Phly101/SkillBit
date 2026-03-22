import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.drawerItems});

  final List<Widget> drawerItems;

  @override
  Widget build(final BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: drawerItems.length,
        physics: const BouncingScrollPhysics(),
        padding: const .all(10),
        itemBuilder: (final BuildContext context, final int index) {
          return drawerItems[index];
        },
      ),
    );
  }
}
