import 'package:dartz/dartz.dart';
import 'package:skill_bit/features/contests/domain/entities/contest_details_entity.dart';
import 'package:skill_bit/features/contests/domain/entities/contest_results_entity.dart';
import 'package:skill_bit/features/contests/domain/entities/leaderboard_response_entity.dart';

import '../../../../core/entities/quiz_entity.dart';
import '../../../../core/entities/results_details_entity.dart';
import '../../../../core/entities/review_results_entity.dart';
import '../../../../core/entities/send_answers_entity.dart';
import '../../../../core/error/failure.dart';

abstract class ContestRepository {
  Future<Either<Failure, ContestDetailsEntity>> getContestDetails();

  //--- fetch Logic ---
  Future<Either<Failure, QuizEntity>> startContest(final String contestId);

  //--- Completion Logic ---
  Future<Either<Failure, ResultsDetails>> submitContest(
    final SendAnswers answers,
  );

  Future<Either<Failure, ReviewResultEntity>> reviewAnswers(
    final String contestId,
  );

  Future<Either<Failure, LeaderboardResponseEntity>> getLeaderBoardData();

  Future<Either<Failure, ContestResultsEntity>> getContestResults(
    final String contestId,
  );
  Future<Either<Failure,void>> joinContest(final String contestId);
}
