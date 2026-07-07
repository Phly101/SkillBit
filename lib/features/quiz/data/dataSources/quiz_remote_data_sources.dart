import 'package:skill_bit/core/models/results_model.dart';
import 'package:skill_bit/core/models/quiz_model.dart';
import '../../../../core/entities/send_answers_entity.dart';
import '../../../../core/models/review_result_model.dart';

abstract class QuizRemoteDataSources {
  //--- fetch Logic ---
  Future<QuizModel> startQuiz(final String quizId);

  //--- Completion Logic ---
  Future<ResultsModel> submitQuiz(final SendAnswers answers);

  Future<ReviewResultModel> reviewAnswers(final String quizId);
}
