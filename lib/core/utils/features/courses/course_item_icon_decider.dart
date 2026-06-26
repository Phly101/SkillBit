import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../features/course/domain/entities/enums/quiz_status.dart';

class CourseItemIconDecider {
  CourseItemIconDecider._();

  static IconData decideLessonIcon(final bool decide) {
    return decide ? FontAwesomeIcons.lock : FontAwesomeIcons.squareCheck;
  }

  static IconData decideQuizIcon( final QuizStatus status) {
    return status == QuizStatus.locked
        ? FontAwesomeIcons.lock
        : status == QuizStatus.completed
        ? FontAwesomeIcons.squareCheck
        : FontAwesomeIcons.brain;
  }
}
