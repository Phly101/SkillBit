import 'package:dartz/dartz.dart';
import 'package:skill_bit/features/course/data/models/level_model.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';
import '../../../../core/error/failure.dart';
import '../entities/course_entity.dart';

abstract class CourseRepo {
  // --- Discovery & Initialization ---
  Future<Either<Failure, List<LevelModel>>> fetchCoursesByLevel(
    final String levelId,
  );

  Future<Either<Failure, List<CourseEntity>>> getLevelRoadMap();

  // --- Detailed Information ---
  Future<Either<Failure, CourseEntity>> getCourseDetails(final String courseId);

  Future<Either<Failure, LessonEntity>> getLessonDetails(
    final String lessonId,
    final String courseId,
  );

  // --- Active Learning Actions ---
  Future<Either<Failure, Unit>> watchVideo(
    final String videoId,
    final String lessonId,
    final String courseId,
  );

  Future<Either<Failure, Unit>> visitArticle(
    final String articleId,
    final String lessonId,
    final String courseId,
  );

  //--- Progress Tracking ---
  Future<Either<Failure, double>> getCourseProgress(final String courseId);

  Future<Either<Failure, Unit>> updateCourseProgress(
    final String courseId,
    final double progress,
  );
}
