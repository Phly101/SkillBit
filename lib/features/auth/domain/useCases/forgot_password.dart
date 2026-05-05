import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/email_params.dart';

class ForgotPassword implements UseCase<void, EmailParams> {
  const ForgotPassword({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, void>> call(final EmailParams params) {
    return authRepo.forgotPassword(email: params.email);
  }
}
