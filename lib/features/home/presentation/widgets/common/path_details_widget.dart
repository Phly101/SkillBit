import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/pie_chart_widget.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/path_widget.dart';

class PathDetailsWidget extends StatelessWidget {
  const PathDetailsWidget({
    super.key,
    required this.courseTitles,
    required this.lockedCourses,
    required this.coursesListLength,
    required this.progress,
    required this.activeStep,
  });

  final num progress;
  final List<String> courseTitles;
  final List<bool> lockedCourses;
  final int coursesListLength;
  final int activeStep;

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
                  progressMade: progress,
                  progressLeft: (100 - progress).clamp(0, 100),
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
            activeStep: activeStep,
          ),
        ],
      ).pNum(15),
    ).p10();
  }
}
