import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/course/domain/entities/enums/course_type.dart';

import 'lesson_model.dart';

class CourseModel extends CourseEntity {
  CourseModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.progress,
    required super.isLocked,
    required super.lessons,
    required super.courseType,
    required super.scoreEarned,
  });

  factory CourseModel.fromJson(final Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      progress: json['progress'],
      isLocked: json['isLocked'],
      lessons: (json['lessons'] as List<dynamic>)
          .map((final dynamic c) => LessonModel.fromJson(c))
          .toList(),
      courseType: CourseType.values.firstWhere(
        (final CourseType e) => e.toString().split('.').last == json['type'],
        orElse: () => CourseType.other,
      ),
      scoreEarned: json['scoreEarned'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'progress': progress,
      'isLocked': isLocked,
      'lessons': lessons,
      'courseType': courseType,
      'scoreEarned': scoreEarned,
    };
  }
}
