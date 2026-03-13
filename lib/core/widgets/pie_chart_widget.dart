import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({
    super.key,
    required this.progressMade,
    required this.progressLeft,
    required this.title,
    this.height = 250,
  });

  final double progressMade;
  final double progressLeft;
  final double height;
  final String title;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  double displayProgressMade = 0.01;
  double displayProgressLeft = 100.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          displayProgressMade = widget.progressMade;
          displayProgressLeft = widget.progressLeft;
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
          height: widget.height,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 80,
              sections: <PieChartSectionData>[
                PieChartSectionData(
                  color: context.colorScheme.tertiary,
                  value: displayProgressMade,
                  showTitle: false,
                  radius: 20,
                ),
                PieChartSectionData(
                  color: Colors.grey.withValues(alpha: 0.5),
                  value: displayProgressLeft,
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
              tween: Tween<double>(begin: 0, end: widget.progressMade),
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
            Text(widget.title, style: context.textTheme.displayLarge),
          ],
        ),
      ],
    );
  }
}
