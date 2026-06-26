import 'package:skill_bit/features/course/domain/useCases/params/course_params.dart';

import '../course_usecase_index.dart'
    hide UpdateCourseProgressParams, LessonDetailsEntity, LessonParams;

class GetCourseDetailsUseCase
    implements UseCase<CourseDetailsEntity, CourseParams> {
  GetCourseDetailsUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, CourseDetailsEntity>> call(final CourseParams params) {
    return courseRepo.getCourseDetails(params.courseId);
  }
}
