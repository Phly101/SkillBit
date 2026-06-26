import 'quiz_view_entity.dart';
import 'resource_entity.dart';

class LessonDetailsEntity {
  LessonDetailsEntity({
    required this.name,
    required this.description,
    required this.id,
    required this.resources,
    required this.quiz,
    required this.isLocked,
    required this.prerequisiteId,
    required this.imageUrl,
  });

  final String name;
  final String description;
  final String id;
  final String imageUrl;
  final List<MaterialEntity>? resources;
  final QuizViewEntity? quiz;
  final bool isLocked;
  final String? prerequisiteId;
}

class LessonViewEntity {
  LessonViewEntity({
    required this.name,
    required this.id,
    required this.isLocked,
    required this.quiz,
  });

  final String name;
  final String id;
  final bool isLocked;
  final QuizViewEntity? quiz;
}
