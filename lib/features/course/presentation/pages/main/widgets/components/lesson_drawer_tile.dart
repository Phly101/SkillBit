// lesson_drawer_tile.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/courses/course_item_icon_decider.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';
import '../../../../../../../core/widgets/global/nav_tile_widget.dart';


class LessonDrawerTile extends StatelessWidget {
  const LessonDrawerTile({
    super.key,
    required this.courseId,
    required this.courseImageUrl,
    required this.lesson,
  });

  final String courseId;
  final String courseImageUrl;
  final LessonViewEntity lesson;

  void _onTap(final BuildContext context) {
    if (lesson.isLocked) return;
    
    Navigator.pop(context);
    context.goNamed(
      'lesson_page',
      pathParameters: <String, String>{
        'courseId': courseId,
        'lessonId': lesson.id,
      },
      queryParameters: <String, String>{
        'imageUrl': courseImageUrl,
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return NavTileWidget(
      title: lesson.name,
      isIcon: true,
      icon: CourseItemIconDecider.decideLessonIcon(lesson.isLocked),
      iconColor: lesson.isLocked
          ? context.colorScheme.onSurface
          : context.colorScheme.onError,
      size: 30,
      function: () => _onTap(context),
    );
  }
}