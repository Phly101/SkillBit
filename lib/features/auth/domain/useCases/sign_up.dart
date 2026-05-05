import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';
import 'package:skill_bit/features/auth/domain/useCases/params/sign_up_params.dart';

import '../entities/user_entity.dart';

class SignUp implements UseCase<UserEntity, SignUpParams> {
  const SignUp({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, UserEntity>> call(final SignUpParams params) {
    return authRepo.signUp(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}
