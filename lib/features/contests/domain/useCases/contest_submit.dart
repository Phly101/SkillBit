import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/entities/results_details_entity.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/contests/domain/repositories/contest_repo.dart';
import 'package:skill_bit/features/quiz/domain/useCases/params/send_params.dart';


class ContestSubmit implements UseCase<ResultsDetails, SendParams> {
  ContestSubmit({required this.contestRepo});

  final ContestRepository contestRepo;

  @override
  Future<Either<Failure, ResultsDetails>> call(final SendParams params) {
    return contestRepo.submitContest(params.answers);
  }
}
