import 'package:skill_bit/core/constants/api_endpoints.dart';
import 'package:skill_bit/features/course/data/models/home_course_model.dart';
import 'package:skill_bit/features/course/data/models/home_details_model.dart';
import '../../../../../core/network/api_client.dart';
import '../../models/course_model.dart';
import '../../models/lesson_model.dart';
import '../course_remote_data_source.dart';

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  const CourseRemoteDataSourceImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<void> enrollCourse(final String courseId) async {
    await apiClient.post(endpoint: ApiEndpoints.enrollCourse(courseId));
    return;
  }

  @override
  Future<List<HomeCourseModel>> fetchCoursesByLevel(final int levelId) async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getCoursesByLevel(levelId.toString()),
    );
    return (response as List<dynamic>)
        .map(
          (final dynamic e) =>
              HomeCourseModel.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<void> finishCourse(final String courseId) async {
    await apiClient.post(endpoint: ApiEndpoints.finishCourse(courseId));
    return;
  }

  @override
  Future<CourseDetailsModel> getCourseDetails(final String courseId) async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getCourseById(courseId),
    );
    return CourseDetailsModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<HomeDetailsModel> getHomeData(final int levelId) async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getUserHomeScreenData(levelId.toString()),
    );
    return HomeDetailsModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<LessonDetailsModel> getLessonDetails(final String lessonId) async {
    final dynamic response = await apiClient.get(
      endpoint: ApiEndpoints.getLessonWithQuiz(lessonId),
    );
    return LessonDetailsModel.fromJson(response as Map<String, dynamic>);
  }

  // @override
  // Future<double> getCourseProgress(final String courseId) {
  //   // TODO: implement getCourseProgress
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Unit> updateCourseProgress(
  //   final String courseId,
  //   final double progress,
  // ) {
  //   // TODO: implement updateCourseProgress
  //   throw UnimplementedError();
  // }
}
