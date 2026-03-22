import '../course_usecase_index.dart'
    hide UpdateCourseProgressParams, LessonEntity, CourseEntity, LessonParams;

class VisitArticleUseCase implements UseCase<Unit, ResourceParams> {
  VisitArticleUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, Unit>> call(final ResourceParams params) {
    return courseRepo.visitArticle(params.id, params.courseId, params.lessonId);
  }
}
