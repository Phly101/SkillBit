import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
      Text(title,
      style: context.textTheme.displayLarge,
      )]);
  }
}
