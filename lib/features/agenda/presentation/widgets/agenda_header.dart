import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class AgendaHeader extends StatelessWidget {
  const AgendaHeader({super.key});

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Text('My agenda', style: context.textTheme.displayLarge),
    ).pV(40);
  }
}
