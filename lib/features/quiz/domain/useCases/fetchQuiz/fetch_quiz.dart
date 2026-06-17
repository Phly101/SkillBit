import '../params/quiz_params.dart';
import '../quiz_usecase_index.dart' hide UpdateQuizProgressParams;

class FetchQuiz implements UseCase<QuizEntity, QuizParams> {
  FetchQuiz({required this.quizRepository});

  final QuizRepository quizRepository;

  @override
  Future<Either<Failure, QuizEntity>> call(final QuizParams params) {
    return quizRepository.getQuizDetails(params.id);
  }
}
