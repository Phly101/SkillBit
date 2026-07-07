
import '../entities/review_question_entity.dart';

class ReviewQuestionModel extends ReviewQuestionEntity {
  ReviewQuestionModel({
    required super.question,
    required super.options,
    required super.chosenAnswerIndex,
    required super.correctAnswerIndex,
    required super.correctAnswerHint,
    required super.isCorrect,
  });

  factory ReviewQuestionModel.fromJson(final Map<String, dynamic> json) {
    return ReviewQuestionModel(
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((final dynamic e) => e as String)
          .toList(),
      chosenAnswerIndex: json['chosenAnswerIndex'] as String,
      correctAnswerIndex: json['correctAnswerIndex'] as String,
      correctAnswerHint: json['correctAnswerHint'] as String? ?? '',
      isCorrect: json['isCorrect'] as bool,
    );
  }
}
