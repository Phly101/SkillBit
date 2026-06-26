import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import '../../domain/repositories/settings_repo.dart';
import '../dataSources/settings_remote_data_source.dart';
import '../models/settings_model.dart';

class SettingsRepoImpl implements SettingsRepo {
  const SettingsRepoImpl({required this.remoteDataSource});

  final SettingsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, String>> uploadImage(final String imagePath) async {
    try {
      final String profilePictureUrl = await remoteDataSource.uploadImage(
        File(imagePath),
      );
      return Right<Failure, String>(profilePictureUrl);
    } catch (e) {
      return Left<Failure, String>(ServerFailures(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SettingsModel>> getSettings() async {
    try {
      final SettingsModel settings = await remoteDataSource.getSettings();
      return Right<Failure, SettingsModel>(settings);
    } catch (e) {
      return Left<Failure, SettingsModel>(
        ServerFailures(message: e.toString()),
      );
    }
  }
}
