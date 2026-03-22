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
    required this.imageUrl,
  });

  final String title;
  final String description;
  final String id;
  final String imageUrl;
  final List<ResourceEntity>? resources;
  final QuizViewEntity? quiz;
  final bool isLocked;
  final String? prerequisiteId;
}
