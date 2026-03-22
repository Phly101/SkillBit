import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/exceptions/exception.dart';
import 'package:skill_bit/features/course/data/dataSources/course_local_data_source.dart';
import 'package:skill_bit/features/course/data/models/level_model.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';
import 'package:skill_bit/features/course/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepo {
  const CourseRepositoryImpl({required this.courseLocalDataSource});

  final CourseLocalDataSource courseLocalDataSource;

  @override
  Future<Either<Failure, List<LevelModel>>> fetchCoursesByLevel(
    final String levelId,
  ) async {
    try {
      print('DEBUG: Fetched courses and now in repoImpl');
      final List<LevelModel> result = await courseLocalDataSource
          .fetchCoursesByLevel(levelId);
      return Right<Failure, List<LevelModel>>(result);
    } catch (e, stacktrace) { // Catch 'e' to see the actual error
      print('DEBUG: REPO CAUGHT ERROR: $e');
      print('DEBUG: STACKTRACE: $stacktrace');
      return Left<Failure, List<LevelModel>>(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> getCourseDetails(
    final String courseId,
  ) async {
    try {
      final CourseEntity result = await courseLocalDataSource.getCourseDetails(
        courseId,
      );
      return Right<Failure, CourseEntity>(result);
    } on CacheException {
      return Left<Failure, CourseEntity>(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, double>> getCourseProgress(
    final String courseId,
  ) async {
    try {
      final double result = await courseLocalDataSource.getCourseProgress(
        courseId,
      );
      return Right<Failure, double>(result);
    } on CacheException {
      return Left<Failure, double>(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, LessonEntity>> getLessonDetails(
    final String lessonId,
    final String courseId,
  ) async {
    try {
      final LessonEntity result = await courseLocalDataSource.getLessonDetails(
        lessonId,
        courseId,
      );
      return Right<Failure, LessonEntity>(result);
    } on CacheException {
      return Left<Failure, LessonEntity>(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getLevelRoadMap() async {
    try {
      final List<CourseEntity> result = await courseLocalDataSource
          .getLevelRoadMap();
      return Right<Failure, List<CourseEntity>>(result);
    } on CacheException {
      return Left<Failure, List<CourseEntity>>(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCourseProgress(
    final String courseId,
    final double progress,
  ) async {
    try {
      final Unit result = await courseLocalDataSource.updateCourseProgress(
        courseId,
        progress,
      );
      return Right<Failure, Unit>(result);
    } on CacheException {
      return Left<Failure, Unit>(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, Unit>> visitArticle(
    final String articleId,
    final String lessonId,
    final String courseId,
  ) async {
    try {
      final Unit result = await courseLocalDataSource.visitArticle(
        articleId,
        lessonId,
        courseId,
      );
      return Right<Failure, Unit>(result);
    } on CacheException {
      return Left<Failure, Unit>(CacheFailures());
    }
  }

  @override
  Future<Either<Failure, Unit>> watchVideo(
    final String videoId,
    final String lessonId,
    final String courseId,
  ) async {
    try {
      final Unit result = await courseLocalDataSource.watchVideo(
        videoId,
        lessonId,
        courseId,
      );
      return Right<Failure, Unit>(result);
    } on CacheException {
      return Left<Failure, Unit>(CacheFailures());
    }
  }
}
