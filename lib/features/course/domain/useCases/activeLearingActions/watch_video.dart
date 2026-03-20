import '../course_usecase_index.dart'
    hide UpdateCourseProgressParams, LessonEntity, CourseEntity, LessonParams;

class WatchVideoUseCase implements UseCase<Unit, ResourceParams> {
  WatchVideoUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, Unit>> call(final ResourceParams params) {
    return courseRepo.watchVideo(params.id, params.lessonId, params.courseId);
  }
}
