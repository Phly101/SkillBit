import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:skill_bit/core/entities/quiz_entity.dart';
import 'package:skill_bit/core/entities/results_details_entity.dart';
import 'package:skill_bit/core/entities/review_results_entity.dart';
import 'package:skill_bit/core/error/exceptions/exception.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/contests/data/dataSources/contest_remote_data_sources.dart';
import 'package:skill_bit/features/contests/domain/entities/contest_details_entity.dart';
import 'package:skill_bit/features/contests/domain/entities/contest_results_entity.dart';
import 'package:skill_bit/features/contests/domain/entities/leaderboard_response_entity.dart';
import 'package:skill_bit/features/contests/domain/repositories/contest_repo.dart';
import '../../../../core/entities/send_answers_entity.dart';

class ContestRepoImpl implements ContestRepository {
  const ContestRepoImpl({required this.contestRemoteDataSources});

  final ContestRemoteDataSources contestRemoteDataSources;

  @override
  Future<Either<Failure, ContestDetailsEntity>> getContestDetails() async {
    try {
      final ContestDetailsEntity result = await contestRemoteDataSources
          .getContestDetails();
      return Right<Failure, ContestDetailsEntity>(result);
    } on NoInternetException {
      return Left<Failure, ContestDetailsEntity>(NoInternetFailures());
    } on NotFoundException {
      return const Left<Failure, ContestDetailsEntity>(
        MessageFailure('Contest not found'),
      );
    } catch (e) {
      return const Left<Failure, ContestDetailsEntity>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, QuizEntity>> startContest(
    final String contestId,
  ) async {
    try {
      final QuizEntity result = await contestRemoteDataSources.startContest(
        contestId,
      );
      return Right<Failure, QuizEntity>(result);
    } on NoInternetException {
      return Left<Failure, QuizEntity>(NoInternetFailures());
    } on NotFoundException {
      return const Left<Failure, QuizEntity>(
        MessageFailure('Contest not found'),
      );
    } catch (e) {
      return const Left<Failure, QuizEntity>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, ResultsDetails>> submitContest(
    final SendAnswers answers,
  ) async {
    try {
      final ResultsDetails result = await contestRemoteDataSources
          .submitContest(answers);
      return Right<Failure, ResultsDetails>(result);
    } on NoInternetException {
      return Left<Failure, ResultsDetails>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, ResultsDetails>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, ReviewResultEntity>> reviewAnswers(
    final String contestId,
  ) async {
    try {
      final ReviewResultEntity result = await contestRemoteDataSources
          .reviewAnswers(contestId);
      return Right<Failure, ReviewResultEntity>(result);
    } on NoInternetException {
      return Left<Failure, ReviewResultEntity>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, ReviewResultEntity>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, LeaderboardResponseEntity>>
  getLeaderBoardData() async {
    try {
      final LeaderboardResponseEntity result = await contestRemoteDataSources
          .getLeaderBoardData();
      return Right<Failure, LeaderboardResponseEntity>(result);
    } on NoInternetException {
      return Left<Failure, LeaderboardResponseEntity>(NoInternetFailures());
    } catch (e) {
      debugPrint('getLeaderBoardData parsing/error: $e');
      return const Left<Failure, LeaderboardResponseEntity>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, ContestResultsEntity>> getContestResults(
    final String contestId,
  ) async {
    try {
      final ContestResultsEntity result = await contestRemoteDataSources
          .getContestResults(contestId);
      return Right<Failure, ContestResultsEntity>(result);
    } on NoInternetException {
      return Left<Failure, ContestResultsEntity>(NoInternetFailures());
    } catch (e) {
      debugPrint('getContestResults parsing/error: $e');
      return const Left<Failure, ContestResultsEntity>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, void>> joinContest(final String contestId) async {
    try {
      await contestRemoteDataSources.joinContest(contestId);
      return const Right<Failure, void>(
        null,
      );
    } catch (e) {
      return const Left<Failure, void>(ServerFailures(message: 'Join Contest Error'));
    }
  }
}
