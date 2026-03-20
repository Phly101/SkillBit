import 'quiz_view_entity.dart';
import 'resource_entity.dart';

class LessonEntity {
  LessonEntity({
    required this.title,
    required this.description,
    required this.id,
    required this.resources,
    required this.quiz,
    required this.isLocked,
    required this.prerequisiteId,
  });

  final String title;
  final String description;
  final String id;
  final List<ResourceEntity>? resources;
  final QuizViewEntity quiz;
  final bool isLocked;
  final String? prerequisiteId;
}
