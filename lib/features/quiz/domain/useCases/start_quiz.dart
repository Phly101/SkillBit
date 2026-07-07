import 'params/quiz_params.dart';
import 'quiz_usecase_index.dart' ;

class AttemptQuiz implements UseCase<QuizEntity, QuizParams> {
  AttemptQuiz({required this.quizRepository});

  final QuizRepository quizRepository;

  @override
  Future<Either<Failure, QuizEntity>> call(final QuizParams params) {
    return quizRepository.startQuiz(params.id);
  }
}
