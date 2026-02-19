
import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';

import '../repositories/onboarding_repo.dart';

class CompleteOnboardingUseCase implements UseCase<void,NoParams>{
  const CompleteOnboardingUseCase(this.repo);

  final OnboardingRepo repo;

  @override
  Future<Either<Failure,void>> call(final NoParams noParams) {
    return repo.complete();
  }
}
