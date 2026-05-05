import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/profile_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';

class GrowthGraphWidget extends StatelessWidget {
  const GrowthGraphWidget({super.key});

  //Todo: most of the data here must be exchanged for a variable data not fixed
  @override
  Widget build(final BuildContext context) {
    final List<FlSpot> dummyData = <FlSpot>[
      const FlSpot(0, 0),
      const FlSpot(1, 300),
      const FlSpot(2, 180),
      const FlSpot(3, 260),
      const FlSpot(4, 100),
      const FlSpot(5, 340),
      const FlSpot(6, 210),
      const FlSpot(7, 140),
      const FlSpot(8, 80),
      const FlSpot(9, 771),
      const FlSpot(10, 420),
      const FlSpot(11, 600),
    ];

    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            ProfileStrings.performance,
            style: context.textTheme.displayMedium!.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
        20.heightBox,
        SizedBox(
          width: double.infinity,
          height: 250,
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 1000,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 100,
                getDrawingHorizontalLine: (final double value) {
                  return FlLine(
                    color: context.colorScheme.outlineVariant.withValues(
                      alpha: 0.2,
                    ),
                    strokeWidth: 1,
                    dashArray: <int>[5, 5],
                  );
                },
              ),
              lineTouchData: LineTouchData(
                enabled: true,
                handleBuiltInTouches: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (final LineBarSpot touchedSpot) =>
                      context.colorScheme.primary,
                  tooltipBorderRadius: BorderRadius.circular(8),
                  tooltipPadding: const EdgeInsets.all(8),
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipItems: (final List<LineBarSpot> touchedSpots) {
                    return touchedSpots.map((final LineBarSpot barSpot) {
                      return LineTooltipItem(
                        '${barSpot.y.toInt()} pts',
                        context.textTheme.bodySmall!.copyWith(
                          color: context.colorScheme.surface,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList();
                  },
                ),
                getTouchedSpotIndicator:
                    (
                      final LineChartBarData barData,
                      final List<int> spotIndexes,
                    ) {
                      return spotIndexes.map((final int index) {
                        return TouchedSpotIndicatorData(
                          FlLine(
                            color: context.colorScheme.primary.withValues(
                              alpha: 0.5,
                            ),
                            strokeWidth: 2,
                            dashArray: <int>[5, 5],
                          ),
                          const FlDotData(show: true),
                        );
                      }).toList();
                    },
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: <LineChartBarData>[
                LineChartBarData(
                  spots: dummyData,
                  barWidth: 4,
                  isCurved: true,
                  color: context.colorScheme.primary,
                  curveSmoothness: 0.35,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: <Color>[
                        context.colorScheme.primary.withValues(alpha: 0.7),
                        context.colorScheme.secondary.withValues(alpha: 0.5),
                        context.colorScheme.tertiary.withValues(alpha: 0.3),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),

                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 100,
                    reservedSize: 45,
                    getTitlesWidget:
                        (final double value, final TitleMeta meta) {
                          return Text(
                            value.toInt().toString(),
                            style: context.textTheme.bodySmall,
                          );
                        },
                  ),
                ),
                bottomTitles: AxisTitles(
                  axisNameWidget: Text(
                    ProfileStrings.graphBottomTitle,
                    style: context.textTheme.bodySmall,
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 1,
                    getTitlesWidget:
                        (final double value, final TitleMeta meta) {
                          const List<String> months = <String>[
                            'Jan',
                            'Feb',
                            'Mar',
                            'Apr',
                            'May',
                            'Jun',
                            'Jul',
                            'Aug',
                            'Sep',
                            'Oct',
                            'Nov',
                            'Dec',
                          ];
                          final int index = value.toInt();
                          final String text =
                              (index >= 0 && index < months.length)
                              ? months[index]
                              : '';

                          return SideTitleWidget(
                            space: 12,
                            meta: meta,
                            child: Text(
                              text,
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.colorScheme.primary,
                              ),
                            ),
                          );
                        },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
