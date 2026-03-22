import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/search/domain/repositories/search_repo.dart';
import 'package:skill_bit/features/search/domain/useCases/params/search_course_params.dart';

class SearchCourseUseCase
    implements UseCase<List<CourseEntity>, SearchCourseParams> {
  SearchCourseUseCase(this.searchRepo);

  final SearchRepository searchRepo;

  @override
  Future<Either<Failure, List<CourseEntity>>> call(
    final SearchCourseParams params,
  ) async {
    return await searchRepo.searchCourses(params.query);
  }
}
