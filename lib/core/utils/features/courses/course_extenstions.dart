import 'package:skill_bit/features/course/domain/entities/course_entity.dart';

extension CourseListX on List<HomeCourseEntity> {
  List<String> get courseTitles =>
      map((final HomeCourseEntity e) => e.title).toList();

  List<bool> get lockedStatus =>
      map((final HomeCourseEntity e) => e.isLocked).toList();

  List<num> get courseProgress =>
      map((final HomeCourseEntity e) => e.progress).toList();
}
