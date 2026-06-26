import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user_profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../dataSources/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl({required this.profileRemoteDataSource});

  final ProfileRemoteDataSource profileRemoteDataSource;

  @override
  Future<Either<Failure, UserProfileEntity>> getProfileData() async {
    try {
      final UserProfileEntity result = await profileRemoteDataSource
          .getProfileData();
      return Right<Failure, UserProfileEntity>(result);
    } on NoInternetException {
      return Left<Failure, UserProfileEntity>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, UserProfileEntity>(ServerFailures());
    }
  }
}
