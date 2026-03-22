import 'package:skill_bit/features/course/data/models/level_model.dart';

import '../course_usecase_index.dart'
    hide UpdateCourseProgressParams, LessonEntity, LessonParams, ResourceParams;

class FetchCoursesByLevelUseCase
    implements UseCase<List<LevelModel>, IdParams> {
  FetchCoursesByLevelUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, List<LevelModel>>> call(final IdParams params) {
    return courseRepo.fetchCoursesByLevel(params.id);
  }
}
