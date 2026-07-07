import 'package:skill_bit/core/models/quiz_model.dart';
import 'package:skill_bit/core/models/results_model.dart';
import 'package:skill_bit/features/contests/data/models/contest_details_model.dart';
import 'package:skill_bit/features/contests/data/models/leaderboard_model.dart';

import '../../../../core/entities/send_answers_entity.dart';
import '../../../../core/models/review_result_model.dart';
import '../models/contest_results_model.dart';

abstract class ContestRemoteDataSources {
  Future<ContestDetailsModel> getContestDetails();

  Future<QuizModel> startContest(final String contestId);

  Future<ResultsModel> submitContest(final SendAnswers answers);

  Future<ReviewResultModel> reviewAnswers(final String contestId);

  Future<LeaderboardResponseModel> getLeaderBoardData();

  Future<ContestResultsModel> getContestResults(final String contestId);

  Future<void> joinContest(final String contestId);
}
