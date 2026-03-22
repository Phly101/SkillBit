import 'package:flutter/material.dart';
import 'package:skill_bit/core/widgets/global/pie_chart_widget.dart';

class ProgressPieChartWidget extends StatelessWidget {
  const ProgressPieChartWidget({
    super.key,
    required this.progressMade,
    required this.progressLeft,
    required this.title,
  });

  final double progressMade;
  final double progressLeft;
  final String title;

  @override
  Widget build(final BuildContext context) {
    return PieChartWidget(
      progressMade: progressMade,
      progressLeft: progressLeft,
      title: title,

    );
  }
}
