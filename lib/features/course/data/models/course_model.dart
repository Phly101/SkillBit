import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/course/domain/entities/enums/course_type.dart';
import '../../domain/entities/enums/enrollment_status.dart';
import 'lesson_view_model.dart';

class CourseDetailsModel extends CourseDetailsEntity {
  CourseDetailsModel({
    required super.isEnrolled,
    required super.status,
    required super.id,
    required super.title,
    required super.description,
    required super.type,
    required super.isTutorial,
    required super.isLocked,
    required super.courseImage,
    required super.lessons,
  });

  factory CourseDetailsModel.fromJson(final Map<String, dynamic> json) {
    final Map<String, dynamic> course =
        json['course'] as Map<String, dynamic>? ?? <String, dynamic>{};

    final EnrollmentStatus status = EnrollmentStatus.values.firstWhere(
      (final dynamic e) => e.toString().split('.').last == course['status'],
      orElse: () => EnrollmentStatus.unknown,
    );

    return CourseDetailsModel(
      status: status,
      isEnrolled: course['isEnrolled'] as bool? ?? false,
      id: course['_id'] as String? ?? course['id'] as String? ?? '',
      title: course['title'] as String? ?? '',
      description: course['description'] as String? ?? '',
      isLocked: course['isLocked'] as bool? ?? false,
      courseImage: course['courseImage'] as String? ?? '',
      isTutorial: course['isTutorial'] as bool? ?? false,
      type: CourseType.values.firstWhere(
        (final dynamic e) => e.toString().split('.').last == course['type'],
        orElse: () => CourseType.other,
      ),
      lessons:
          (course['lessons'] as List<dynamic>?)
              ?.map(
                (final dynamic c) =>
                    LessonViewModel.fromJson(c as Map<String, dynamic>),
              )
              .toList() ??
          <LessonViewModel>[],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'isEnrolled': isEnrolled,
      'id': id,
      'title': title,
      'description': description,
      'courseImage': courseImage,
      'lessons': lessons.map((final LessonViewModel e) => e.toJson()).toList(),
      'status': status.toString().split('.').last,
      'type': type.toString().split('.').last,
      'isTutorial': isTutorial,
      'isLocked': isLocked,
    };
  }
}
