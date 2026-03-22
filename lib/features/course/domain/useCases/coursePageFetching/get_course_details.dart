import '../course_usecase_index.dart'
    hide UpdateCourseProgressParams, LessonEntity,LessonParams,ResourceParams;

class GetCourseDetailsUseCase implements UseCase<CourseEntity, IdParams> {
  GetCourseDetailsUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, CourseEntity>> call(final IdParams params) {
    return courseRepo.getCourseDetails(params.id);
  }
}
