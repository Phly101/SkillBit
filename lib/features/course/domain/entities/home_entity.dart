import 'package:skill_bit/features/course/domain/entities/course_entity.dart';

class HomeDetailsEntity {
  HomeDetailsEntity({
    required this.courses,
    required this.userName,
    required this.imageUrl,
    required this.levelProgress,
  });

  final String userName;
  final String? imageUrl;
  final num levelProgress;
  final List<HomeCourseEntity> courses;

  int get activeStep {
    final int index = courses.indexWhere(
      (final HomeCourseEntity course) => course.isLocked,
    );
    return index == -1 ? courses.length : index;
  }
}
