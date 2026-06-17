import '../quiz_usecase_index.dart' hide QuizEntity,IdParams;

class UpdateQuizProgress implements UseCase<Unit, UpdateQuizProgressParams> {
  UpdateQuizProgress({required this.quizRepository});

  final QuizRepository quizRepository;

  @override
  Future<Either<Failure, Unit>> call(final UpdateQuizProgressParams params) {
    return quizRepository.updateQuizProgress(params.quizId, params.score);
  }
}
