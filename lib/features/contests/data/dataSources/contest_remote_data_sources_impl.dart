import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:skill_bit/core/models/send_contest_answer_model.dart';
import 'package:skill_bit/features/contests/data/models/contest_details_model.dart';
import 'package:skill_bit/features/contests/data/models/contest_results_model.dart';
import 'package:skill_bit/features/contests/data/models/leaderboard_model.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/entities/send_answers_entity.dart';
import '../../../../core/error/exceptions/exception.dart';
import '../../../../core/models/quiz_model.dart';
import '../../../../core/models/results_model.dart';
import '../../../../core/models/review_result_model.dart';
import '../../../../core/network/api_client.dart';
import 'contest_remote_data_sources.dart';

class ContestRemoteDataSourcesImpl implements ContestRemoteDataSources {
  const ContestRemoteDataSourcesImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<ContestDetailsModel> getContestDetails() async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getContestDetails,
    );
    return ContestDetailsModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<QuizModel> startContest(final String contestId) async {
    final dynamic response = await apiClient.post(
      endpoint: ApiEndpoints.startContest(contestId),
    );
    debugPrint('🔵 RAW RESPONSE: $response');
    return QuizModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<ResultsModel> submitContest(final SendAnswers answers) async {
    final SendContestAnswerModel answersModel = SendContestAnswerModel(
      quizId: answers.quizId,
      answers: answers.answers,
      timeTaken: answers.timeTaken,
    );

    final dynamic response = await apiClient.post(
      endpoint: ApiEndpoints.submitContest,
      data: answersModel.toJson(),
    );

    return ResultsModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<ReviewResultModel> reviewAnswers(final String contestId) async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getContestAnswers(contestId),
    );
    return ReviewResultModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<LeaderboardResponseModel> getLeaderBoardData() async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getContestLeaderBoard,
    );
    return LeaderboardResponseModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<ContestResultsModel> getContestResults(final String contestId) async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getContestResults(contestId),
    );
    return ContestResultsModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<void> joinContest(final String contestId) async {
    try {
      await apiClient.post(endpoint: ApiEndpoints.joinContest(contestId));
    } on DioException catch (e) {
      if (e.error is BadRequestException &&
          (e.error as BadRequestException).message ==
              'You already joined this contest') {
        return;
      }
      rethrow;
    }
  }
}
