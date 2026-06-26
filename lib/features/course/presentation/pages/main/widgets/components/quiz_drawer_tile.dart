// quiz_drawer_tile.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/courses/course_item_icon_decider.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';
import 'package:skill_bit/features/course/domain/entities/enums/quiz_status.dart';
import '../../../../../../../core/widgets/global/nav_tile_widget.dart';


class QuizDrawerTile extends StatelessWidget {
  const QuizDrawerTile({
    super.key,
    required this.courseId,
    required this.lesson,
  });

  final String courseId;
  final LessonViewEntity lesson;

  bool get _isLocked => lesson.quiz!.isLocked;
  bool get _isCompleted => lesson.quiz!.status == QuizStatus.completed;

  void _onTap(final BuildContext context) {
    if (_isLocked) return;

    final Map<String, String> queryParams = <String, String>{
      'title': lesson.quiz!.title,
      'difficulty': lesson.quiz!.difficulty ?? 'easy',
      'time': (lesson.quiz!.timeLimit ?? 30).toString(),
      'passingScore': (lesson.quiz!.passingScore ?? 70).toString(),
    };

    Navigator.pop(context);
    context.goNamed(
      'quiz_details',
      pathParameters: <String, String>{
        'courseId': courseId,
        'lessonId': lesson.id,
        'quizId': lesson.quiz!.id,
      },
      queryParameters: queryParams,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return NavTileWidget(
      title: '${lesson.name} Quiz',
      isIcon: true,
      icon: CourseItemIconDecider.decideQuizIcon(lesson.quiz!.status),
      iconColor: _isLocked
          ? context.colorScheme.onSurface
          : (_isCompleted
          ? context.colorScheme.onError
          : context.colorScheme.onSurface),
      size: 30,
      function: () => _onTap(context),
    );
  }
}