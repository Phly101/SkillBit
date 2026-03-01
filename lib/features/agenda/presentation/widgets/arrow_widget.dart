import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class ArrowWidget extends StatelessWidget {
  const ArrowWidget({super.key, required this.arrowIcon});

  final IconData arrowIcon;

  @override
  Widget build(final BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.onSurface),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(arrowIcon, color: context.colorScheme.onSurface).pNum(5),
    );
  }
}
