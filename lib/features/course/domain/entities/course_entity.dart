import 'package:skill_bit/features/course/domain/entities/enums/course_type.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';

class CourseEntity {
  CourseEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.progress,
    required this.isLocked,
    required this.lessons,
    required this.courseType,
    required this.scoreEarned,
  });

  final CourseType courseType;
  final String id;
  final String title;
  final String imageUrl;
  final double progress;
  final List<LessonEntity>? lessons;
  final int scoreEarned;
  final bool isLocked;
}
