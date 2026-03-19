import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/pie_chart_widget.dart';
import 'package:skill_bit/core/widgets/shadow_container.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/path_widget.dart';

class PathDetailsWidget extends StatelessWidget {
  const PathDetailsWidget({
    super.key,
    required this.progressMade,
    required this.progressLeft,
    required this.courseTitles,
    required this.lockedCourses,
    required this.coursesListLength,
  });

  final double progressMade;
  final double progressLeft;
  final List<String> courseTitles;
  final List<bool> lockedCourses;
  final int coursesListLength;

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      borderRadius: 12,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Over all Path', style: context.textTheme.displayLarge),
              const Spacer(),
              Expanded(
                child: PieChartWidget(
                  progressMade: progressMade,
                  progressLeft: progressLeft,
                  progressColor: context.colorScheme.secondary,
                  title: '',
                  height: 80,
                  centerSpace: 30,
                  centerTextColor: context.colorScheme.secondary,
                  centerTextSize: 20,
                  hasTitle: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          PathWidget(
            courseTitles: courseTitles,
            lockedCourses: lockedCourses,
            coursesListLength: coursesListLength,
          ),
        ],
      ).pNum(15),
    ).p10();
  }
}
