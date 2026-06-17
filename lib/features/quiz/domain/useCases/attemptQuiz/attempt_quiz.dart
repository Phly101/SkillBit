import '../params/quiz_params.dart';
import '../quiz_usecase_index.dart' hide UpdateQuizProgressParams;

class AttemptQuiz implements UseCase<QuizEntity, QuizParams> {
  AttemptQuiz({required this.quizRepository});

  final QuizRepository quizRepository;

  @override
  Future<Either<Failure, QuizEntity>> call(final QuizParams params) {
    return quizRepository.attemptQuiz(params.id);
  }
}
