import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/course/data/dataSources/course_remote_data_source.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/course/domain/entities/home_entity.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';
import 'package:skill_bit/features/course/domain/repositories/course_repository.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/error/exceptions/exception.dart';
import '../../../../core/utils/storage/course_id_cache.dart';

class CourseRepositoryImpl implements CourseRepo {
  const CourseRepositoryImpl({required this.courseRemoteDataSource});

  final CourseRemoteDataSource courseRemoteDataSource;

  @override
  Future<Either<Failure, List<HomeCourseEntity>>> fetchCoursesByLevel(
    final int levelId,
  ) async {
    try {
      final List<HomeCourseEntity> result = await courseRemoteDataSource
          .fetchCoursesByLevel(levelId);
      return Right<Failure, List<HomeCourseEntity>>(result);
    } on NoInternetException {
      return Left<Failure, List<HomeCourseEntity>>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, List<HomeCourseEntity>>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, CourseDetailsEntity>> getCourseDetails(
    final String courseId,
  ) async {
    try {
      final CourseDetailsEntity result = await courseRemoteDataSource
          .getCourseDetails(courseId);
      return Right<Failure, CourseDetailsEntity>(result);
    } on NoInternetException {
      return Left<Failure, CourseDetailsEntity>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, CourseDetailsEntity>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, LessonDetailsEntity>> getLessonDetails(
    final String lessonId,
  ) async {
    try {
      final LessonDetailsEntity result = await courseRemoteDataSource
          .getLessonDetails(lessonId);
      return Right<Failure, LessonDetailsEntity>(result);
    } on NoInternetException {
      return Left<Failure, LessonDetailsEntity>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, LessonDetailsEntity>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, void>> enrollCourse(final String courseId) async {
    try {
      await courseRemoteDataSource.enrollCourse(courseId);
      return const Right<Failure, void>(null);
    } on NoInternetException {
      return Left<Failure, void>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, void>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, void>> finishCourse(final String courseId) async {
    try {
      await courseRemoteDataSource.finishCourse(courseId);
      return const Right<Failure, void>(null);
    } on NoInternetException {
      return Left<Failure, void>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, void>(ServerFailures());
    }
  }

  @override
  Future<Either<Failure, HomeDetailsEntity>> getHomeData(
    final int levelId,
  ) async {
    try {
      final HomeDetailsEntity homeData = await courseRemoteDataSource
          .getHomeData(levelId);
      final Map<String, String> courseIds = <String, String>{
        for (final HomeCourseEntity course in homeData.courses)
          course.title: course.id,
      };
      sl<CourseIdCache>().store(courseIds);
      return Right<Failure, HomeDetailsEntity>(homeData);
    } on NoInternetException {
      return Left<Failure, HomeDetailsEntity>(NoInternetFailures());
    } catch (e) {
      return const Left<Failure, HomeDetailsEntity>(ServerFailures());
    }
  }
}
