import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/course/domain/entities/home_entity.dart';
import 'package:skill_bit/features/course/domain/useCases/params/level_params.dart';
import '../../repositories/course_repository.dart';

class GetHomeDataUseCase implements UseCase<HomeDetailsEntity, LevelParams> {
  GetHomeDataUseCase({required this.courseRepo});

  final CourseRepo courseRepo;

  @override
  Future<Either<Failure, HomeDetailsEntity>> call(final LevelParams params) {
    return courseRepo.getHomeData(params.levelIndex,);
  }
}
