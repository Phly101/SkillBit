import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class LineProgressWidget extends StatelessWidget {
  const LineProgressWidget({
    super.key,
    required this.progress,
    this.progressColor = AppColors.mainBlue,
    this.minHeight =8,
  });

  final Color progressColor;
  final double? progress;
  final double? minHeight;

  @override
  Widget build(final BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: const Color(0xffCFDBE8),
      valueColor: AlwaysStoppedAnimation<Color>(progressColor),
      minHeight: 8,
    );
  }
}
