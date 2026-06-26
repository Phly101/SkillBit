
import '../entities/review_results_entity.dart';
import 'review_question_model.dart';

class ReviewResultModel extends ReviewResultEntity {
  ReviewResultModel({
    required super.score,
    required super.correctCount,
    required super.totalQuestions,
    required super.questions,
  });

  factory ReviewResultModel.fromJson(final Map<String, dynamic> json) {
    final Map<String, dynamic> data = json['data'] as Map<String, dynamic>;

    return ReviewResultModel(
      score: data['score'] as num,
      correctCount: data['correctCount'] as num,
      totalQuestions: data['totalQuestions'] as num,
      questions: (data['questionsWithAnswers'] as List<dynamic>)
          .map(
            (final dynamic q) =>
                ReviewQuestionModel.fromJson(q as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
