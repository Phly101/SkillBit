import 'package:skill_bit/features/course/data/models/lesson_view_model.dart';
import 'package:skill_bit/features/course/domain/entities/enums/course_type.dart';
import 'package:skill_bit/features/course/domain/entities/enums/enrollment_status.dart';

class CourseDetailsEntity {
  CourseDetailsEntity({
    required this.isEnrolled,
    required this.status,
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.isTutorial,
    required this.isLocked,
    required this.courseImage,
    required this.lessons,
  });
  final bool isEnrolled;
  final EnrollmentStatus status;
  final String id;
  final String title;
  final String description;
  final CourseType type;
  final bool isTutorial;
  final bool isLocked;
  final String courseImage;
  final List<LessonViewModel> lessons;
}

//-----------------------------------------------------------------

class HomeCourseEntity {
  HomeCourseEntity({
    required this.isEnrolled,
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.progress,
    required this.isLocked,
    required this.courseType,
    required this.status,
    required this.isTutorial,
  });

  final bool isEnrolled;
  final bool isTutorial;
  final EnrollmentStatus status;
  final CourseType courseType;
  final String id;
  final String description;
  final String title;
  final String imageUrl;
  final num progress;
  final bool isLocked;
}
