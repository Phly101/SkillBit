
import '../entities/quiz_question_entity.dart';

class QuizQuestionModel extends QuizQuestionEntity {
  QuizQuestionModel({required super.question, required super.options});

  factory QuizQuestionModel.fromJson(final Map<String, dynamic> json) {
    return QuizQuestionModel(
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((final dynamic e) => e as String)
          .toList(),
    );
  }
}
