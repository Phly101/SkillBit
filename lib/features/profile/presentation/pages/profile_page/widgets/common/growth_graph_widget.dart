import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/profile_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';

class GrowthGraphWidget extends StatelessWidget {
  const GrowthGraphWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    // --- DATA SOURCE ---
    // Maps months (X: 0-11) to performance scores (Y)
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
        // --- HEADER ---
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

        // --- CHART CONTAINER ---
        // Setting a fixed height prevents the "stretching/distortion" issue
        SizedBox(
          width: double.infinity,
          height: 250,
          child: LineChart(
            LineChartData(
              // --- AXIS RANGE ---
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 1000,

              // --- BACKGROUND GRID ---
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false, // Clean look: horizontal lines only
                horizontalInterval: 100, // Distance between background lines
                getDrawingHorizontalLine: (final double value) {
                  return FlLine(
                    color: context.colorScheme.outlineVariant.withValues(
                      alpha: 0.2,
                    ),
                    strokeWidth: 1,
                    dashArray: <int>[5, 5], // Creates the dashed effect
                  );
                },
              ),

              // --- INTERACTIVE TOOLTIP (Pop-up on Tap) ---
              lineTouchData: LineTouchData(
                enabled: true,
                handleBuiltInTouches: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (final LineBarSpot touchedSpot) =>
                      context.colorScheme.primary,
                  tooltipBorderRadius: BorderRadius.circular(8),
                  tooltipPadding: const EdgeInsets.all(8),
                  fitInsideHorizontally: true,
                  // Prevents bubble clipping on screen edges
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
                // The vertical line & dot that appears when you touch a point
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

              // --- CHART BORDER ---
              borderData: FlBorderData(show: false),

              // --- MAIN DATA LINE ---
              lineBarsData: <LineChartBarData>[
                LineChartBarData(
                  spots: dummyData,
                  barWidth: 4,
                  isCurved: true,
                  // Enables the "wave" look
                  color: context.colorScheme.primary,
                  curveSmoothness: 0.35,
                  dotData: const FlDotData(show: true),
                  // Shows the fixed circles on line

                  // The color fill underneath the line
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

              // --- AXIS LABELS (Titles) ---
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),

                // Y-AXIS (Left Side)
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 100, // Shows labels at 0, 100, 200...
                    reservedSize: 45, // Breathing room so text isn't "eaten"
                    getTitlesWidget:
                        (final double value, final TitleMeta meta) {
                          return Text(
                            value.toInt().toString(),
                            style: context.textTheme.bodySmall,
                          );
                        },
                  ),
                ),

                // X-AXIS (Bottom Side - Months)
                bottomTitles: AxisTitles(
                  axisNameWidget: Text(
                    ProfileStrings.graphBottomTitle,
                    style: context.textTheme.bodySmall,
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 1, // Evaluate every single integer (0, 1, 2...)
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
                          // Safety check to ensure index is within month range
                          final String text = (index >= 0 && index < months.length)
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
