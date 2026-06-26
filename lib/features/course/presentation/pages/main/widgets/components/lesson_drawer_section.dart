// lesson_drawer_section.dart
import 'package:flutter/material.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';

import 'lesson_drawer_tile.dart';
import 'quiz_drawer_tile.dart';

class LessonDrawerSection extends StatelessWidget {
  const LessonDrawerSection({
    super.key,
    required this.courseId,
    required this.courseImageUrl,
    required this.lesson,
  });

  final String courseId;
  final String courseImageUrl;
  final LessonViewEntity lesson;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        LessonDrawerTile(
          courseId: courseId,
          courseImageUrl: courseImageUrl,
          lesson: lesson,
        ),
        if (lesson.quiz != null)
          QuizDrawerTile(courseId: courseId, lesson: lesson),
      ],
    );
  }
}