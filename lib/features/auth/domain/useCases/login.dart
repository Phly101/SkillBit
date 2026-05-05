import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/login_params.dart';

class Login implements UseCase<void, LoginParams> {
  const Login({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, void>> call(final LoginParams params) {
    return authRepo.login(email: params.email, password: params.password);
  }
}

