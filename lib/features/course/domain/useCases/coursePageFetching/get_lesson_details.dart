import '../course_usecase_index.dart'
    hide UpdateCourseProgressParams, CourseEntity,ResourceParams;

class GetLessonDetailsUseCase implements UseCase<LessonEntity, LessonParams> {
  GetLessonDetailsUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, LessonEntity>> call(final LessonParams params) {
    return courseRepo.getLessonDetails(params.lessonId, params.courseId);
  }
}
