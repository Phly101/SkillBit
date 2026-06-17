import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/quiz_entity.dart';

abstract class QuizRepository {
  //--- fetch Logic ---
  Future<Either<Failure, QuizEntity>> getQuizDetails(final String quizId);

  //--- attempt and review attempt Logic ---
  Future<Either<Failure, QuizEntity>> attemptQuiz(final String quizId);

  //--- reattempt quiz  Logic ---
  Future<Either<Failure, Unit>> updateQuizProgress(
    final String quizId,
    final int score,
  );

  //--- Completion Logic ---
  Future<Either<Failure, Unit>> markQuizAsCompleted(final String quizId);
}
