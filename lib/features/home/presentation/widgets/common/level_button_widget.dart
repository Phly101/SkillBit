import 'package:flutter/material.dart';
import 'package:skill_bit/core/widgets/button_widget.dart';

import '../../../../../core/theme/theme.dart';

class LevelButtonWidget extends StatelessWidget {
  const LevelButtonWidget({
    super.key,
    required this.level,
    required this.function,
  });

  final String level;
  final void Function()? function;

  @override
  Widget build(final BuildContext context) {
    return ButtonWidget(
      function: function,
      radius: 20,
      paddingL: 20,
      paddingR: 20,
      hasBorder: true,
      child: Text(
        level,
        style: context.textTheme.displayMedium!.copyWith(
          color: context.colorScheme.secondary,
        ),
      ),
    ).p10();
  }
}
