import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';

class Logout implements UseCase<void, NoParams> {
  const Logout({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, void>> call(final NoParams params) {
    return authRepo.logout();
  }
}



