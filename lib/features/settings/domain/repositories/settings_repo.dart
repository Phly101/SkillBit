
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/settings_entity.dart';

abstract class SettingsRepo {
  Future<Either<Failure, String>> uploadImage(final String imagePath);

  Future<Either<Failure, SettingsEntity>> getSettings();
}