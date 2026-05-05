import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/reset_password_params.dart';

class ResetPassword implements UseCase<void, ResetPasswordParams> {
  const ResetPassword({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, void>> call(final ResetPasswordParams params) {
    return authRepo.resetPassword(
      email: params.email,
      code: params.code,
      newPassword: params.newPassword,
    );
  }
}
