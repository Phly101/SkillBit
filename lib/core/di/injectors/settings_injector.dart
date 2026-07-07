import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/features/settings/domain/useCases/get_settings.dart';
import 'package:skill_bit/features/settings/domain/useCases/upload_image.dart';

import '../../../features/settings/data/dataSources/settings_remote_data_source.dart';
import '../../../features/settings/data/dataSources/settings_remote_data_source_impl.dart';
import '../../../features/settings/data/repositories/settings_repo_impl.dart';
import '../../../features/settings/domain/repositories/settings_repo.dart';
import '../../../features/settings/presentation/Bloc/settings_bloc.dart';

void initSettingsFeature() {
  //! Data Sources
  sl.registerLazySingleton<SettingsRemoteDataSource>(
        () => SettingsRemoteDataSourceImpl(apiClient: sl()),
  );

  //! Repository
  sl.registerLazySingleton<SettingsRepo>(
        () => SettingsRepoImpl(remoteDataSource: sl()),
  );

  //! Use Cases
  sl.registerLazySingleton(() => GetSettings(settingsRepo: sl()));
  sl.registerLazySingleton(() => UploadImage(settingsRepo: sl()));

  //! Feature Bloc
  sl.registerFactory(() => SettingsBloc(getSettings: sl(), uploadImage: sl()));
}
