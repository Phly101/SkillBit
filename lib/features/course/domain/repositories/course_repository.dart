import 'package:dartz/dartz.dart';

import 'package:skill_bit/features/course/domain/entities/home_entity.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';
import '../../../../core/error/failure.dart';
import '../entities/course_entity.dart';

abstract class CourseRepo {
  // --- Discovery & Initialization ---
  Future<Either<Failure, List<HomeCourseEntity>>> fetchCoursesByLevel(
    final int levelId,
  );

  Future<Either<Failure, void>> enrollCourse(final String courseId);

  Future<Either<Failure, HomeDetailsEntity>> getHomeData(
    final int levelId,
  );

  Future<Either<Failure, void>> finishCourse(final String courseId);

  // --- Detailed Information ---
  Future<Either<Failure, CourseDetailsEntity>> getCourseDetails(
    final String courseId,
  );

  Future<Either<Failure, LessonDetailsEntity>> getLessonDetails(
    final String lessonId,
  );


  // //--- Progress Tracking ---
  // Future<Either<Failure, double>> getCourseProgress(final String courseId);

  // Future<Either<Failure, Unit>> updateCourseProgress(
  //   final String courseId,
  //   final double progress,
  // );
}
