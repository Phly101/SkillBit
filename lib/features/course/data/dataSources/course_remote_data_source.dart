import 'package:skill_bit/features/course/data/models/course_model.dart';
import 'package:skill_bit/features/course/data/models/home_course_model.dart';
import '../models/home_details_model.dart';
import '../models/lesson_model.dart';

abstract class CourseRemoteDataSource {
  Future<List<HomeCourseModel>> fetchCoursesByLevel(final int levelId);

  Future<void> enrollCourse(final String courseId);

  Future<HomeDetailsModel> getHomeData(final int levelId);

  Future<void> finishCourse(final String courseId);

  // --- Detailed Information ---
  Future<CourseDetailsModel> getCourseDetails(final String courseId);

  Future<LessonDetailsModel> getLessonDetails(final String lessonId);

  // //--- Progress Tracking ---
  // Future<double> getCourseProgress(final String courseId);

  // Future<Unit> updateCourseProgress(
  //   final String courseId,
  //   final double progress,
  // );
}
