import 'package:flutter/material.dart';

import '../../../../../core/theme/theme.dart';

class ScreenLayout extends StatelessWidget {

  const ScreenLayout({
    super.key,
    required this.widget,

  });
  final Widget widget;


  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Container(
        child: widget,
      ).pH(20)
    ).pV(40);
  }
}
