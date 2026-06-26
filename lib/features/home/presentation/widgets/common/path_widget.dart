import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

import 'alternating_step.dart';

class PathWidget extends StatelessWidget {
  const PathWidget({
    super.key,
    required this.courseTitles,
    required this.lockedCourses,
    required this.coursesListLength,
    required this.activeStep,
    this.function,
  });

  final List<String> courseTitles;
  final List<bool> lockedCourses;
  final int coursesListLength;
  final int activeStep;
  final void Function(int index)? function;

  @override
  Widget build(final BuildContext context) {
    final Color primary = context.colorScheme.primary;
    final Color outline = context.colorScheme.outline;

    // Layout constants - Increased stepWidth to accommodate labels
    const double stepWidth = 120.0; 
    const double firstStepOffset = 60.0;

    final double totalPathWidth =
        (coursesListLength * stepWidth) + (firstStepOffset * 2);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: firstStepOffset),
        width: totalPathWidth,
        child: EasyStepper(
          stepRadius: 15,
          alignment: Alignment.centerLeft,
          showLoadingAnimation: false,
          activeStep: activeStep,
          lineStyle: LineStyle(
            lineLength: stepWidth - 30,
            lineType: LineType.normal,
            defaultLineColor: outline,
            finishedLineColor: primary,
            lineThickness: 2,
          ),
          steps: <EasyStep>[
            for (int index = 0; index < coursesListLength; index++)
              AlternatingStep(
                title: courseTitles[index],
                isLocked: lockedCourses[index],
                primary: primary,
                outline: outline,
              ),
          ],
          onStepReached: function,
        ),
      ),
    );
  }
}
