import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/auth/domain/repositories/auth_repo.dart';

class CheckAuthStatus implements UseCase<bool, NoParams> {
  const CheckAuthStatus({required this.authRepo});

  final AuthRepo authRepo;

  @override
  Future<Either<Failure, bool>> call(final NoParams params) async {
    final Either<Failure, bool> result = await authRepo.isAuthenticated();
    return result;
  }
}
