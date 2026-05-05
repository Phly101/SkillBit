import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/email_params.dart';

class ResendVerificationCode implements UseCase<void, EmailParams> {
  const ResendVerificationCode({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, void>> call(final EmailParams params) {
    return authRepo.reSendVerificationCode(email: params.email);
  }
}
