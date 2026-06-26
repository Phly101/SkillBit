import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/course/domain/repositories/course_repository.dart';
import 'package:skill_bit/features/course/domain/useCases/params/course_params.dart';


class FinishCourse implements UseCase<void, CourseParams> {
  FinishCourse({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, void>> call(final CourseParams params) {
    return courseRepo.finishCourse(params.courseId);
  }
}
