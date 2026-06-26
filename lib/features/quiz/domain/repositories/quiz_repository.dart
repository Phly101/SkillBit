import 'package:dartz/dartz.dart';
import '../../../../core/entities/results_details_entity.dart';
import '../../../../core/entities/review_results_entity.dart';
import '../../../../core/entities/send_answers_entity.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/entities/quiz_entity.dart';

abstract class QuizRepository {
  //--- fetch Logic ---
  Future<Either<Failure, QuizEntity>> startQuiz(final String quizId);


  //--- Completion Logic ---
  Future<Either<Failure, ResultsDetails>> submitQuiz(
    final SendAnswers answers,
  );

  Future<Either<Failure, ReviewResultEntity>> reviewAnswers(
    final String quizId,
  );
}
