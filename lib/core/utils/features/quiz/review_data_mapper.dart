// review_data_mapper.dart

import '../../../entities/quiz_question_entity.dart';
import '../../../entities/review_question_entity.dart';

class ReviewDataMapper {
  ReviewDataMapper._();

  static int? _letterToIndex(final String letter) {
    return letter.isNotEmpty ? letter.codeUnitAt(0) - 65 : null;
  }

  static List<QuizQuestionEntity> toQuizQuestions(
    final List<ReviewQuestionEntity> reviewQuestions,
  ) {
    return reviewQuestions.map((final ReviewQuestionEntity q) {
      return QuizQuestionEntity(
        question: q.question,
        options: q.options,
        correctAnswerIndex: _letterToIndex(q.correctAnswerIndex),
        correctAnswerHint: q.correctAnswerHint,
      );
    }).toList();
  }

  static Map<int, int> toSelectedAnswers(
    final List<ReviewQuestionEntity> reviewQuestions,
  ) {
    final Map<int, int> selectedAnswers = <int, int>{};
    for (int i = 0; i < reviewQuestions.length; i++) {
      final int? chosenIndex = _letterToIndex(
        reviewQuestions[i].chosenAnswerIndex,
      );
      if (chosenIndex != null) {
        selectedAnswers[i] = chosenIndex;
      }
    }
    return selectedAnswers;
  }
}
