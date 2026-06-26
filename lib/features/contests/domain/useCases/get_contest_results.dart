import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/contests/domain/useCases/params/contest_params.dart';
import '../entities/contest_results_entity.dart';
import '../repositories/contest_repo.dart';

class GetContestResults
    implements UseCase<ContestResultsEntity, ContestParams> {
  GetContestResults({required this.contestRepo});

  final ContestRepository contestRepo;

  @override
  Future<Either<Failure, ContestResultsEntity>> call(
    final ContestParams params,
  ) {
    return contestRepo.getContestResults(params.id);
  }
}
