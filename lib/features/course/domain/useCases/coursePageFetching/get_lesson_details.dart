import '../course_usecase_index.dart'
    hide UpdateCourseProgressParams, CourseDetailsEntity;

class GetLessonDetailsUseCase implements UseCase<LessonDetailsEntity, LessonParams> {
  GetLessonDetailsUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, LessonDetailsEntity>> call(final LessonParams params) {
    return courseRepo.getLessonDetails(params.lessonId,);
  }
}
