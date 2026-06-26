import 'package:flutter/cupertino.dart';
import 'package:skill_bit/core/constants/api_endpoints.dart';
import 'package:skill_bit/core/models/results_model.dart';
import 'package:skill_bit/features/quiz/data/dataSources/quiz_remote_data_sources.dart';
import 'package:skill_bit/core/models/quiz_model.dart';
import '../../../../core/entities/send_answers_entity.dart';
import '../../../../core/models/review_result_model.dart';
import '../../../../core/models/send_answer_model.dart';
import '../../../../core/network/api_client.dart';

class QuizRemoteDataSourceImpl implements QuizRemoteDataSources {
  const QuizRemoteDataSourceImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<QuizModel> startQuiz(final String quizId) async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.startQuiz(quizId),
    );
    debugPrint('🔵 RAW RESPONSE: $response');
    return QuizModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<ResultsModel> submitQuiz(final SendAnswers answers) async {
    final SendQuizAnswersModel answersModel = SendQuizAnswersModel(
      quizId: answers.quizId,
      answers: answers.answers,
      timeTaken: answers.timeTaken,
    );

    final dynamic response = await apiClient.post(
      endpoint: ApiEndpoints.submitQuiz,
      data: answersModel.toJson(),
    );

    return ResultsModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<ReviewResultModel> reviewAnswers(final String quizId) async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getQuizAnswers(quizId),
    );
    return ReviewResultModel.fromJson(response as Map<String, dynamic>);
  }
}
