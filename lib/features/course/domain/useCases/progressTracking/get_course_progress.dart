import '../course_usecase_index.dart'
    hide UpdateCourseProgressParams, LessonEntity, CourseEntity,LessonParams,ResourceParams;

class GetCourseProgressUseCase implements UseCase<double, IdParams> {
  GetCourseProgressUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, double>> call(final IdParams params) {
    return courseRepo.getCourseProgress(params.id);
  }
}
