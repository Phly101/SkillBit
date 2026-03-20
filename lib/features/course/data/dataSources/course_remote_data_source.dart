import 'package:dartz/dartz.dart';

import '../models/course_model.dart';
import '../models/lesson_model.dart';

abstract class CourseRemoteDataSource {
  // --- Discovery & Initialization ---
  Future<List<CourseModel>> fetchCoursesByLevel(final String levelId);

  Future<List<CourseModel>> getLevelRoadMap();

  // --- Detailed Information ---
  Future<CourseModel> getCourseDetails(final String courseId);

  Future<LessonModel> getLessonDetails(final String lessonId);

  // --- Active Learning Actions ---
  Future<Unit> watchVideo(final String videoId);

  Future<Unit> visitArticle(final String articleId);

  //--- Progress Tracking ---
  Future<double> getCourseProgress(final String courseId);

  Future<Unit> updateCourseProgress(
    final String courseId,
    final double progress,
  );
}
