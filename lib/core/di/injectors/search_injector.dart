import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/features/search/data/dataSources/search_local_data_source.dart';
import 'package:skill_bit/features/search/domain/repositories/search_repo.dart';
import '../../../features/search/data/repositories/search_repo_impl.dart';
import '../../../features/search/domain/useCases/search_course_usecase.dart';
import '../../../features/search/domain/useCases/search_friends_usecase.dart';
import '../../../features/search/presentation/bloc/search_course_bloc/search_course_bloc.dart';
import '../../../features/search/presentation/bloc/search_friends_bloc/search_friends_bloc.dart';

void initSearchFeature() {
  //! Data Sources
  sl.registerLazySingleton<SearchLocalDataSource>(
    () => SearchLocalDataSourceImpl(),
  );

  //! Repository
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepoImpl(searchLocalDataSource: sl()),
  );

  //! Use Cases
  sl.registerLazySingleton(() => SearchFriendsUseCase(sl()));
  sl.registerLazySingleton(() => SearchCourseUseCase(sl()));

  //! Feature Bloc
  sl.registerFactory(() => SearchFriendsBloc(friendsUseCase: sl()));
  sl.registerFactory(() => SearchCourseBloc(searchCourseUseCase: sl()));
}
