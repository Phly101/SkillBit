
import 'package:skill_bit/features/quiz/domain/useCases/quiz_usecase_index.dart';



class ReviewAnswers implements UseCase<ReviewResultEntity, ReviewParams> {
  ReviewAnswers({required this.quizRepository});

  final QuizRepository quizRepository;

  @override
  Future<Either<Failure, ReviewResultEntity>> call(final ReviewParams params) {
    return quizRepository.reviewAnswers(params.quizId);
  }
}
