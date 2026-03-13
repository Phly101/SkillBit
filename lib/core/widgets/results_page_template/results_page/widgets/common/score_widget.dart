import 'package:flutter/material.dart';
import 'package:skill_bit/core/widgets/pie_chart_widget.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.correctScorePercentage,
    required this.inCorrectScorePercentage,
  });

  final double correctScorePercentage;
  final double inCorrectScorePercentage;

  @override
  Widget build(final BuildContext context) {
    return PieChartWidget(
      progressMade: correctScorePercentage,
      progressLeft: inCorrectScorePercentage,
      title: 'score',
    );
  }
}
