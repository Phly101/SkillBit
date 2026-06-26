
import '../entities/quiz_entity.dart';
import 'quiz_question_model.dart';

class QuizModel extends QuizEntity {
  QuizModel({
    required super.difficulty,
    required super.timeLimit,
    required super.passingScore,
    required super.questions,
    super.participants,
  });

  factory QuizModel.fromJson(final Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['data'] as Map<String, dynamic>;

    return QuizModel(
      difficulty: data['difficulty'] as String,
      timeLimit: data['timeLimit'] as int,
      passingScore: data['passingScore'] as int,
      participants: data['participants'] as int? ?? 0,
      questions: (data['questions'] as List<dynamic>)
          .map((final dynamic q) =>
          QuizQuestionModel.fromJson(q as Map<String, dynamic>))
          .toList(),
    );
  }
}