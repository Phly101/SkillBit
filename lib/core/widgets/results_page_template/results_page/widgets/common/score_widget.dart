import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../../theme/theme.dart';

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({
    super.key,
    required this.correctScorePercentage,
    required this.inCorrectScorePercentage,
  });

  final double correctScorePercentage;
  final double inCorrectScorePercentage;

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  double displayedCorrect = 0.01;
  double displayedIncorrect = 100.0;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          displayedCorrect = widget.correctScorePercentage;
          displayedIncorrect = widget.inCorrectScorePercentage;
        });
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          height: 250,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 80,
              sections: <PieChartSectionData>[
                PieChartSectionData(
                  color: context.colorScheme.tertiary,
                  value: displayedCorrect,
                  showTitle: false,
                  radius: 20,
                ),
                PieChartSectionData(
                  color: Colors.grey.withValues(alpha: 0.5),
                  value: displayedIncorrect,
                  showTitle: false,
                  radius: 20,
                ),
              ],
            ),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: widget.correctScorePercentage,
              ),
              duration: const Duration(milliseconds: 1200),
              builder:
                  (
                    final BuildContext context,
                    final double value,
                    final Widget? child,
                  ) {
                    return Text(
                      '${value.toInt()}%',
                      style: context.textTheme.displayLarge!.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
            ),
            const SizedBox(height: 10),
            Text('Score', style: context.textTheme.displayLarge),
          ],
        ),
      ],
    );
  }
}
