import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/entities/user_entity.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';



class SignInWithGoogle implements UseCase<UserEntity, NoParams> {
  const SignInWithGoogle({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, UserEntity>> call(final NoParams params) {
    return authRepo.signInWithGoogle();
  }
}
