import 'package:skill_bit/features/quiz/domain/useCases/quiz_usecase_index.dart';


class SubmitQuiz implements UseCase<ResultsDetails, SendParams> {
  SubmitQuiz({required this.quizRepository});

  final QuizRepository quizRepository;

  @override
  Future<Either<Failure, ResultsDetails>> call(final SendParams params) {
    return quizRepository.submitQuiz(params.answers);
  }
}
