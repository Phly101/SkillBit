import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/features/course/data/dataSources/course_remote_data_source.dart';
import 'package:skill_bit/features/course/domain/useCases/activeLearingActions/enroll_course.dart';
import 'package:skill_bit/features/course/domain/useCases/activeLearingActions/finish_course.dart';
import 'package:skill_bit/features/course/domain/useCases/coursePageFetching/get_course_details.dart';
import 'package:skill_bit/features/course/domain/useCases/coursePageFetching/get_lesson_details.dart';
import 'package:skill_bit/features/course/domain/useCases/homeFetching/fetch_courses_by_level_use_case.dart';
import 'package:skill_bit/features/course/domain/useCases/homeFetching/get_home_data.dart';
import 'package:skill_bit/features/course/presentation/Bloc/courseDetails/course_details_bloc.dart';
import 'package:skill_bit/features/course/presentation/Bloc/lessonDetails/lesson_details_bloc.dart';
import '../../../features/course/data/dataSources/dataSourcesImpl/course_remote_data_source_impl.dart';
import '../../../features/course/data/repositories/course_repository_impl.dart';
import '../../../features/course/domain/repositories/course_repository.dart';

void initCourseFeature() {
  //! Data Sources
  sl.registerLazySingleton<CourseRemoteDataSource>(
    () => CourseRemoteDataSourceImpl(apiClient: sl()),
  );

  //! Repository
  sl.registerLazySingleton<CourseRepo>(
    () => CourseRepositoryImpl(courseRemoteDataSource: sl()),
  );

  //! Use Cases
  sl.registerLazySingleton(() => FetchCoursesByLevelUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => GetLessonDetailsUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => GetCourseDetailsUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => GetHomeDataUseCase(courseRepo: sl()));
  sl.registerLazySingleton(() => EnrollCourse(courseRepo: sl()));
  sl.registerLazySingleton(() => FinishCourse(courseRepo: sl()));

  //! feature's Blocs
  sl.registerFactory(
    () => CourseDetailsBloc(
      getCourseDetailsUseCase: sl(),
      enrollCourseUseCase: sl(),
      finishCourseUseCase: sl(),
    ),
  );
  sl.registerFactory(() => LessonDetailsBloc(getLessonDetailsUseCase: sl()));
}
