import 'package:skill_bit/features/course/domain/entities/course_entity.dart';

extension CourseListX on List<CourseEntity> {
  List<String> get courseTitles =>
      map((final CourseEntity e) => e.title).toList();

  List<bool> get lockedStatus =>
      map((final CourseEntity e) => e.isLocked).toList();

  //Todo:(to be replaced by Backend later)
  double get completedPercentage {
    if (isEmpty) return 0.0;
    final double completed = where(
      (final CourseEntity e) => e.progress == 1.0,
    ).length.toDouble();
    return (completed / length) * 100;
  }

  // The remainder for the "track"
  double get remainingPercentage => 100 - completedPercentage;
}
