import 'package:dartz/dartz.dart';
import 'package:skill_bit/features/course/data/models/course_model.dart';
import 'package:skill_bit/features/course/data/models/lesson_model.dart';

import '../models/level_model.dart';

abstract class CourseLocalDataSource {
  // --- Discovery & Initialization ---
  Future<List<LevelModel>> fetchCoursesByLevel(final String levelId);

  Future<List<CourseModel>> getLevelRoadMap();

  // --- Detailed Information ---
  Future<CourseModel> getCourseDetails(final String courseId);

  Future<LessonModel> getLessonDetails(
    final String lessonId,
    final String courseId,
  );

  // --- Active Learning Actions ---
  Future<Unit> watchVideo(
    final String videoId,
    final String lessonId,
    final String courseId,
  );

  Future<Unit> visitArticle(
    final String articleId,
    final String lessonId,
    final String courseId,
  );

  //--- Progress Tracking ---
  Future<double> getCourseProgress(final String courseId);

  Future<Unit> updateCourseProgress(
    final String courseId,
    final double progress,
  );
}
