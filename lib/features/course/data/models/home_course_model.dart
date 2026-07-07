import '../../domain/entities/course_entity.dart';
import '../../domain/entities/enums/course_type.dart';
import '../../domain/entities/enums/enrollment_status.dart';

class HomeCourseModel extends HomeCourseEntity {
  HomeCourseModel({
    required super.isEnrolled,
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.progress,
    required super.isLocked,
    required super.courseType,
    required super.description,
    required super.status,
    required super.isTutorial,
  });

  factory HomeCourseModel.fromJson(final Map<String, dynamic> json) {
    return HomeCourseModel(
      isEnrolled: json['isEnrolled'] as bool? ?? false,
      id: json['id'] as String? ?? json['_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      imageUrl: json['image'] as String? ?? '',
      progress: (json['courseProgress'] as num?)?.toDouble() ?? 0.0,
      isLocked: json['isLocked'] as bool? ?? false,
      status: EnrollmentStatus.values.firstWhere(
        (final EnrollmentStatus e) =>
            e.toString().split('.').last == json['status'],
        orElse: () => EnrollmentStatus.unknown,
      ),
      courseType: CourseType.values.firstWhere(
        (final CourseType e) => e.toString().split('.').last == json['type'],
        orElse: () => CourseType.other,
      ),
      description: json['description'] as String? ?? '',
      isTutorial: json['isTutorial'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'isEnrolled': isEnrolled,
      'id': id,
      'title': title,
      'image': imageUrl,
      'progress': progress,
      'isLocked': isLocked,
      'courseType': courseType.toString().split('.').last,
      'description': description,
      'status': status.toString().split('.').last,
      'isTutorial': isTutorial,
    };
  }
}
