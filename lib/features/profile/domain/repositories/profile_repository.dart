import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user_profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfileEntity>> getProfileData();
}
