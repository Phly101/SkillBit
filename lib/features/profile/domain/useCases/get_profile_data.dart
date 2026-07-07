import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/useCases/use_cases.dart';
import '../entities/user_profile_entity.dart';
import '../repositories/profile_repository.dart';

class GetProfileData implements UseCase<UserProfileEntity, NoParams> {
  const GetProfileData({required this.profileRepository});

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, UserProfileEntity>> call(final NoParams params) {
    return profileRepository.getProfileData();
  }
}
