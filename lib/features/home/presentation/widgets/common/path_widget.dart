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
    this.function,
  });

  final List<String> courseTitles;
  final List<bool> lockedCourses;
  final int coursesListLength;
  final void Function(int index)? function;

  //Todo: refactor the step calculations to the home bloc
  @override
  Widget build(final BuildContext context) {
    final Color primary = context.colorScheme.primary;
    final Color outline = context.colorScheme.outline;

    // 1. Logic for active step
    final int calculatedActiveStep = lockedCourses.indexWhere(
      (final bool isLocked) => isLocked,
    );

    // 2. Padding specifically to prevent label clipping
    const double stepWidth = 100.0; // Reduced width to keep it compact
    const double firstStepOffset =
        40.0; // The "Safety Buffer" for the first label

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
          activeStep: calculatedActiveStep,
          lineStyle: LineStyle(
            lineLength: stepWidth - 20,
            lineType: LineType.normal,
            defaultLineColor: outline,
            finishedLineColor: primary,
            lineThickness: 1,
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
