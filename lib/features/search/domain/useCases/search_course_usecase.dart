import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/search/domain/entities/search_courses_entity.dart';
import 'package:skill_bit/features/search/domain/repositories/search_repo.dart';
import 'package:skill_bit/features/search/domain/useCases/params/search_course_params.dart';

class SearchCourseUseCase
    implements SyncUseCase<List<SearchCourseEntity>, SearchCourseParams> {
  SearchCourseUseCase(this.searchRepo);

  final SearchRepository searchRepo;

  @override
  Either<Failure, List<SearchCourseEntity>> call(
    final SearchCourseParams params,
  ) {
    return searchRepo.searchCourses(params.query);
  }
}
