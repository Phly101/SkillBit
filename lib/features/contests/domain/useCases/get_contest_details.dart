import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import '../entities/contest_details_entity.dart';
import '../repositories/contest_repo.dart';

class GetContestDetails
    implements UseCase<ContestDetailsEntity, NoParams> {
  GetContestDetails({required this.contestRepo});

  final ContestRepository contestRepo;

  @override
  Future<Either<Failure, ContestDetailsEntity>> call(
    final NoParams params,
  ) {
    return contestRepo.getContestDetails();
  }
}
