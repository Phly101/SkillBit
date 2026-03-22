import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseItemIconDecider {
  CourseItemIconDecider._();

  static IconData decideLessonIcon(final bool decide) {
    return decide ? FontAwesomeIcons.lock : FontAwesomeIcons.squareCheck;
  }

  static IconData decideQuizIcon(final bool decide, final bool isCompleted) {
    return decide
        ? FontAwesomeIcons.lock
        : isCompleted
        ? FontAwesomeIcons.squareCheck
        : FontAwesomeIcons.brain;
  }
}
