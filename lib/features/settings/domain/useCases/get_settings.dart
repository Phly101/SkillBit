import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/settings/domain/repositories/settings_repo.dart';

import '../entities/settings_entity.dart';

class GetSettings implements UseCase<SettingsEntity, NoParams> {
  GetSettings({required this.settingsRepo});

  SettingsRepo settingsRepo;

  @override
  Future<Either<Failure, SettingsEntity>> call(final NoParams params) {
    return settingsRepo.getSettings();
  }
}
