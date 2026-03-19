import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({
    super.key,
    required this.progressMade,
    required this.progressLeft,
    required this.title,
    this.centerTextColor,
    this.centerSpace = 80,
    this.height = 250,
    this.centerTextSize = 32,
    this.hasTitle = true,
    this.progressColor,
  });

  final double progressMade;
  final double progressLeft;
  final double height;
  final double? centerSpace;
  final double centerTextSize;
  final String title;
  final Color? centerTextColor;
  final bool? hasTitle;
  final Color? progressColor;

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
              startDegreeOffset: -90,
              sectionsSpace: 0,
              centerSpaceRadius: widget.centerSpace,
              centerSpaceColor: Colors.transparent,
              sections: <PieChartSectionData>[
                PieChartSectionData(
                  color: widget.progressColor ?? context.colorScheme.tertiary,
                  gradient: LinearGradient(
                    colors: <Color>[
                      context.colorScheme.secondary,
                      context.colorScheme.primary.withValues(alpha: 0.8),
                      context.colorScheme.primary,
                    ],
                  ),
                  value: displayProgressMade,
                  showTitle: false,
                  radius: 15,
                ),
                PieChartSectionData(
                  color: Colors.grey.withValues(alpha: 0.5),
                  value: displayProgressLeft,
                  showTitle: false,
                  radius: 15,
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
                        fontSize: widget.centerTextSize,
                        fontWeight: FontWeight.bold,
                        color: widget.centerTextColor,
                      ),
                    );
                  },
            ),
            const SizedBox(height: 10),
            widget.hasTitle!
                ? Text(
                    widget.title,
                    maxLines: 2,
                    style: context.textTheme.displayLarge!.copyWith(
                      fontSize: widget.centerTextSize,
                      fontWeight: FontWeight.bold,
                      color: widget.centerTextColor,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
