import 'package:skill_bit/features/course/domain/entities/course_entity.dart';

class LevelEntity {
  LevelEntity({
    required this.id,
    required this.levelIndex,
    required this.title,
    required this.courses,
  });

  final String id;
  final int levelIndex;
  final String title;
  final List<CourseEntity> courses;
}
