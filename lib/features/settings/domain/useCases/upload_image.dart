import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/settings/domain/useCases/params/upload_params.dart';
import '../repositories/settings_repo.dart';

class UploadImage implements UseCase<String, UploadParams> {
  const UploadImage({required this.settingsRepo});

  final SettingsRepo settingsRepo;

  @override
  Future<Either<Failure, String>> call(final UploadParams params) {
    return settingsRepo.uploadImage(params.imageUrl);
  }
}
