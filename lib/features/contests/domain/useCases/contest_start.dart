import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/contests/domain/useCases/params/contest_params.dart';
import '../../../../core/entities/quiz_entity.dart';
import '../repositories/contest_repo.dart';

class ContestStart implements UseCase<QuizEntity, ContestParams> {
  ContestStart({required this.contestRepo});

  final ContestRepository contestRepo;

  @override
  Future<Either<Failure, QuizEntity>> call(final ContestParams params) {
    return contestRepo.startContest(params.id);
  }
}
