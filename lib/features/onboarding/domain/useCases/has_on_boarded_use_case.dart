import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/onboarding/domain/repositories/onboarding_repo.dart';

class HasOnBoarded implements UseCase<bool, NoParams> {
  const HasOnBoarded(this.repo);

  final OnboardingRepo repo;

  @override
  Future<Either<Failure, bool>> call(final NoParams noParams)  {
    return  repo.hasOnBoarded();
  }
}
