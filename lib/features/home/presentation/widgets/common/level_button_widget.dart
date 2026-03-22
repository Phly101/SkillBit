import 'package:flutter/material.dart';
import 'package:skill_bit/core/widgets/global/button_widget.dart';

import '../../../../../core/theme/theme.dart';

class LevelButtonWidget extends StatelessWidget {
  const LevelButtonWidget({
    super.key,
    required this.level,
    required this.function,
    required this.isSelected,
  });

  final String level;
  final bool isSelected;
  final void Function()? function;

  @override
  Widget build(final BuildContext context) {
    return ButtonWidget(
      function: function,
      radius: 20,
      paddingL: 20,
      paddingR: 20,
      hasBorder: true,
      color: isSelected
          ? context.colorScheme.primary
          : context.colorScheme.surface,
      child: Text(
        level,
        style: context.textTheme.displayMedium!.copyWith(
          color: isSelected
              ? context.colorScheme.surface
              : context.colorScheme.secondary,
        ),
      ),
    ).p10();
  }
}
