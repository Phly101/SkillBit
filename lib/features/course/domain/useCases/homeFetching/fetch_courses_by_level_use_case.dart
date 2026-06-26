
import '../course_usecase_index.dart'
    hide UpdateCourseProgressParams, LessonDetailsEntity, LessonParams;

class FetchCoursesByLevelUseCase
    implements UseCase<List<HomeCourseEntity>, IdParams> {
  FetchCoursesByLevelUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, List<HomeCourseEntity>>> call(final IdParams params) {
    return courseRepo.fetchCoursesByLevel(params.id);
  }
}
