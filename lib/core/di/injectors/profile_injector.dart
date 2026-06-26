import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/features/profile/data/dataSources/profile_remote_data_source.dart';
import 'package:skill_bit/features/profile/data/dataSources/profile_remote_data_source_impl.dart';
import 'package:skill_bit/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:skill_bit/features/profile/domain/repositories/profile_repository.dart';
import 'package:skill_bit/features/profile/domain/useCases/get_profile_data.dart';
import 'package:skill_bit/features/profile/presentation/Bloc/profile_bloc.dart';

void initProfileFeature() {
  //! Data Sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(apiClient: sl()),
  );

  //! Repository
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(profileRemoteDataSource: sl()),
  );

  //! Use Cases
  sl.registerLazySingleton(() => GetProfileData(profileRepository: sl()));

  //! Feature Bloc
  sl.registerFactory(() => ProfileBloc(getProfileData: sl()));
}
