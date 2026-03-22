import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/onboarding/data/dataSources/onboarding_local_data_source.dart';
import 'package:skill_bit/features/onboarding/domain/repositories/onboarding_repo.dart';

class OnboardingRepoImpl implements OnboardingRepo {
  const OnboardingRepoImpl({required this.onboardingLocalDataSource});

  final OnboardingLocalDataSource onboardingLocalDataSource;

  @override
  Future<Either<Failure, void>> complete() async {
    try {
      await onboardingLocalDataSource.completeOnboarding();
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, bool>> hasOnBoarded() async {
    try {
      final bool result = await onboardingLocalDataSource
          .hasCompletedOnboarding();
      return Right<Failure, bool>(result);
    } catch (e) {
      return Left<Failure, bool>(CacheFailures());
    }
  }
}
