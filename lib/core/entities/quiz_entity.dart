
import 'quiz_question_entity.dart';

class QuizEntity {
  QuizEntity({
    required this.difficulty,
    required this.timeLimit,
    required this.passingScore,
    required this.questions,
    this.participants,
  });

  final String difficulty;
  final int timeLimit;
  final int passingScore;
  final int? participants;
  final List<QuizQuestionEntity> questions;
}
