import 'package:skill_bit/features/course/data/models/quiz_view_model.dart';
import 'package:skill_bit/features/course/data/models/resource_model.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';

class LessonDetailsModel extends LessonDetailsEntity {
  LessonDetailsModel({
    required super.name,
    required super.description,
    required super.id,
    required super.resources,
    required super.quiz,
    required super.isLocked,
    required super.prerequisiteId,
    required super.imageUrl,
  });

  factory LessonDetailsModel.fromJson(final Map<String, dynamic> json) {
    final dynamic outerLesson = json['lesson'] ?? json;
    final Map<String, dynamic> outerMap = (outerLesson is Map)
        ? Map<String, dynamic>.from(outerLesson)
        : <String, dynamic>{};

    final dynamic innerLesson = outerMap['lesson'] ?? outerMap;
    final Map<String, dynamic> data = (innerLesson is Map)
        ? Map<String, dynamic>.from(innerLesson)
        : <String, dynamic>{};

    return LessonDetailsModel(
      name: data['title'] as String? ?? data['name'] as String? ?? '',
      description: data['description'] as String? ?? '',
      id: data['id'] as String? ?? data['_id'] as String? ?? '',
      resources: (data['materials'] as List<dynamic>? ??
              data['resources'] as List<dynamic>?)
              ?.map(
                (final dynamic c) => (c is String)
                    ? MaterialModel(url: c)
                    : MaterialModel.fromJson(c as Map<String, dynamic>),
              )
              .toList() ??
          <MaterialModel>[],
      quiz: outerMap['quiz'] == null
          ? null
          : QuizViewModel.fromJson(outerMap['quiz'] as Map<String, dynamic>),
      isLocked: data['isLocked'] as bool? ?? false,
      prerequisiteId: data['prerequisiteId'] as String? ?? '',
      imageUrl: data['imageUrl'] as String? ?? data['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': name,
      'description': description,
      'resources': resources,
      'quiz': quiz,
      'isLocked': isLocked,
      'prerequisiteId': prerequisiteId,
      'imageUrl': imageUrl,
    };
  }
}
