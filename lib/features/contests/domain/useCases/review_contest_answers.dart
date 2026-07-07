import 'package:skill_bit/features/contests/domain/repositories/contest_repo.dart';
import 'package:skill_bit/features/quiz/domain/useCases/quiz_usecase_index.dart';





class ReviewContestAnswers implements UseCase<ReviewResultEntity, ReviewParams> {
  ReviewContestAnswers({required this.contestRepository});

  final ContestRepository contestRepository;

  @override
  Future<Either<Failure, ReviewResultEntity>> call(final ReviewParams params) {
    return contestRepository.reviewAnswers(params.quizId);
  }
}
