import '../course_usecase_index.dart' hide LessonEntity, CourseEntity,IdParams,LessonParams,ResourceParams;

class UpdateCourseProgressUseCase
    implements UseCase<Unit, UpdateCourseProgressParams> {
  UpdateCourseProgressUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, Unit>> call(final UpdateCourseProgressParams params) {
    return courseRepo.updateCourseProgress(params.courseId, params.progress);
  }
}
