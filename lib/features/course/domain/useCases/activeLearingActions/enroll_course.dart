import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/course/domain/useCases/params/course_params.dart';
import '../../repositories/course_repository.dart';

class EnrollCourse implements UseCase<void, CourseParams> {
  EnrollCourse({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, void>> call(final CourseParams params) {
    return courseRepo.enrollCourse(params.courseId);
  }
}
