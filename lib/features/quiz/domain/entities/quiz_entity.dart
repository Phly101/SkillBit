import 'package:skill_bit/core/entities/question_entity.dart';

class QuizEntity {
  QuizEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.duration,
    required this.questions,
    required this.isPassed,
    this.score,
    this.completedAt,
  });

  final String id;
  final String title;
  final bool isCompleted;
  final bool isPassed;
  final Duration duration;
  final DateTime? completedAt;
  final int? score;
  final List<QuestionEntity> questions;
}
