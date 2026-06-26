import 'package:skill_bit/core/entities/review_question_entity.dart';

class ReviewResultEntity {
  ReviewResultEntity({
    required this.score,
    required this.correctCount,
    required this.totalQuestions,
    required this.questions,
  });

  final num score;
  final num correctCount;
  final num totalQuestions;
  final List<ReviewQuestionEntity> questions;
}
