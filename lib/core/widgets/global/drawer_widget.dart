import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.drawerItems,
    this.isPadded = false,
  });

  final List<Widget> drawerItems;
  final bool isPadded;

  @override
  Widget build(final BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: isPadded
              ? _ProfileDrawer(drawerItems: drawerItems)
              : _CourseDrawer(drawerItems: drawerItems),
        ),
      ),
    );
  }
}

class _CourseDrawer extends StatelessWidget {
  const _CourseDrawer({required this.drawerItems});

  final List<Widget> drawerItems;

  @override
  Widget build(final BuildContext context) {
    return ListView.builder(
      itemCount: drawerItems.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (final BuildContext context, final int index) =>
          drawerItems[index],
    );
  }
}

class _ProfileDrawer extends StatelessWidget {
  const _ProfileDrawer({required this.drawerItems});

  final List<Widget> drawerItems;

  @override
  Widget build(final BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(drawerItems.take(3).toList()),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ...drawerItems.skip(3),
            ],
          ),
        ),
      ],
    );
  }
}
