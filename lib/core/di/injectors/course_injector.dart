import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/features/course/domain/useCases/activeLearingActions/visit_article.dart';
import 'package:skill_bit/features/course/domain/useCases/activeLearingActions/watch_video.dart';
import 'package:skill_bit/features/course/domain/useCases/coursePageFetching/get_course_details.dart';
import 'package:skill_bit/features/course/domain/useCases/coursePageFetching/get_lesson_details.dart';
import 'package:skill_bit/features/course/domain/useCases/homeFetching/fetch_courses_by_level_use_case.dart';
import 'package:skill_bit/features/course/domain/useCases/homeFetching/get_level_road_map.dart';
import 'package:skill_bit/features/course/domain/useCases/progressTracking/get_course_progress.dart';
import 'package:skill_bit/features/course/domain/useCases/progressTracking/update_course_progress.dart';
import '../../../features/course/data/dataSources/course_local_data_source.dart';
import '../../../features/course/data/dataSources/dataSourcesImpl/course_local_data_source_impl.dart';
import '../../../features/course/data/repositories/course_repository_impl.dart';
import '../../../features/course/domain/repositories/course_repository.dart';
import '../../../features/course/presentation/Bloc/course_bloc.dart';

void initCourseFeature() {
  //! Data Sources
  sl.registerLazySingleton<CourseLocalDataSource>(
    () => CourseLocalDataSourceImpl(),
  );
  // sl.registerLazySingleton<CourseRemoteDataSource>(() => CourseDataSourceImpl());

  //! Repository
  sl.registerLazySingleton<CourseRepo>(
    () => CourseRepositoryImpl(courseLocalDataSource: sl()),
  );

  //! Use Cases
  sl.registerLazySingleton(() => FetchCoursesByLevelUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => GetLevelRoadMapUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => GetLessonDetailsUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => GetCourseDetailsUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => VisitArticleUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => WatchVideoUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => GetCourseProgressUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => UpdateCourseProgressUseCase(courseRepo: sl()));

  //! Feature Bloc
  sl.registerFactory(
    () => CourseBloc(
      fetchCoursesByLevelUseCase: sl(),
      getLevelRoadMapUseCase: sl(),
      getCourseProgressUseCase: sl(),
      updateCourseProgressUseCase: sl(),
      getCourseDetailsUseCase: sl(),
      getLessonDetailsUseCase: sl(),
      visitArticleUseCase: sl(),
      watchVideoUseCase: sl(),
    ),
  );
}
