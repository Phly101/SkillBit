import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/contests/domain/repositories/contest_repo.dart';
import 'package:skill_bit/features/contests/domain/useCases/params/contest_params.dart';

class JoinContest implements UseCase<void,ContestParams>{
  JoinContest({required this.contestRepo});
  final ContestRepository contestRepo;
  @override
  Future<Either<Failure, void>> call(final ContestParams params) {
   return contestRepo.joinContest(params.id);
  }
}