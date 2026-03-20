import 'package:skill_bit/features/course/data/models/quiz_view_model.dart';
import 'package:skill_bit/features/course/data/models/resource_model.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';

class LessonModel extends LessonEntity {
  LessonModel({
    required super.title,
    required super.description,
    required super.id,
    required super.resources,
    required super.quiz,
    required super.isLocked,
    required super.prerequisiteId,
  });

  factory LessonModel.fromJson(final Map<String, dynamic> json) {
    return LessonModel(
      title: json['title'],
      description: json['description'],
      id: json['id'],
      resources: (json['resources'] as List<dynamic>)
          .map((final dynamic c) => ResourceModel.fromJson(c))
          .toList(),
      quiz: QuizViewModel.fromJson(json['quiz']),
      isLocked: json['isLocked'],
      prerequisiteId: json['prerequisiteId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'resources': resources,
      'quiz': quiz,
      'isLocked': isLocked,
      'prerequisiteId': prerequisiteId,
    };
  }
}
