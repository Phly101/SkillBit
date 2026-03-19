import 'package:skill_bit/core/di/injection_container.dart';

import '../../../features/home/presentation/Bloc/home_bloc.dart';

// TODO: Add feature-specific imports here

void initHomeFeature() {
  //! Data Sources
  // sl.registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImpl());
  // sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());

  //! Repository
  // sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl()));

  //! Use Cases
  // sl.registerLazySingleton(() => HomeUseCase(sl()));

  //! Feature Bloc
  sl.registerFactory(() => HomeBloc(fetchCoursesByLevelUseCase: sl()));
}
