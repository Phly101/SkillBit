import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/verification_params.dart';

class VerifyEmail implements UseCase<void, VerificationParams> {
  const VerifyEmail({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, void>> call(final VerificationParams params) {
    return authRepo.verifyEmail(code: params.code, email: params.email);
  }
}
