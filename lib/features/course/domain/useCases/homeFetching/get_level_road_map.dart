import '../course_usecase_index.dart'
    hide UpdateCourseProgressParams, LessonEntity, IdParams,LessonParams,ResourceParams;

class GetLevelRoadMapUseCase implements UseCase<List<CourseEntity>, NoParams> {
  GetLevelRoadMapUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, List<CourseEntity>>> call(final NoParams params) {
    return courseRepo.getLevelRoadMap();
  }
}
