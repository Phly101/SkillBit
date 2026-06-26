import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:skill_bit/core/error/exceptions/exception.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/quiz/data/dataSources/quiz_remote_data_sources.dart';
import 'package:skill_bit/core/entities/quiz_entity.dart';
import 'package:skill_bit/features/quiz/domain/repositories/quiz_repository.dart';

import '../../../../core/entities/results_details_entity.dart';
import '../../../../core/entities/review_results_entity.dart';
import '../../../../core/entities/send_answers_entity.dart';

class QuizRepoImpl implements QuizRepository {
  const QuizRepoImpl({required this.quizRemoteDataSource});

  final QuizRemoteDataSources quizRemoteDataSource;

  @override
  Future<Either<Failure, QuizEntity>> startQuiz(final String quizId) async {
    try {
      final QuizEntity result = await quizRemoteDataSource.startQuiz(quizId);
      return Right<Failure, QuizEntity>(result);
    } on NoInternetException {
      return Left<Failure, QuizEntity>(NoInternetFailures());
    } catch (e, stack) {
      debugPrint('🔴 startQuiz EXCEPTION: $e'); // ✅ add this
      debugPrint('🔴 STACK: $stack'); // ✅ add this
      return const Left<Failure, QuizEntity>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, ResultsDetails>> submitQuiz(final SendAnswers answers) async {
    try {
      final ResultsDetails result = await quizRemoteDataSource.submitQuiz(answers);
      return Right<Failure, ResultsDetails>(result);
    } on NoInternetException {
      return Left<Failure, ResultsDetails>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, ResultsDetails>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, ReviewResultEntity>> reviewAnswers(
    final String quizId,
  ) async {
    try {
      final ReviewResultEntity result = await quizRemoteDataSource
          .reviewAnswers(quizId);
      return Right<Failure, ReviewResultEntity>(result);
    } on NoInternetException {
      return Left<Failure, ReviewResultEntity>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, ReviewResultEntity>(ServerFailures());
    }
  }
}
