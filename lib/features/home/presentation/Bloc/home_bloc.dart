import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/bloc/base_state.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import '../../../../core/useCases/params/id_params.dart';
import '../../../course/data/models/level_model.dart';
import '../../../course/domain/useCases/homeFetching/fetch_courses_by_level_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.fetchCoursesByLevelUseCase}) : super(HomeInitial()) {
    on<LoadHomeData>(_loadingHomeData);
  }

  final FetchCoursesByLevelUseCase fetchCoursesByLevelUseCase;

  Future<void> _loadingHomeData(
    final LoadHomeData event,
    final Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final Either<Failure, List<LevelModel>> result =
        await fetchCoursesByLevelUseCase(IdParams(id: event.levelId));

    result.fold(
      (final Failure failure) =>
          emit(const HomeError(message: 'could not load courses')),
      (final List<LevelModel> levels) {
        if (levels.isEmpty) {
          emit(
            HomeSuccess(
              courses: const <CourseEntity>[],
              levelProgress: 0.0,
              currentLevelId: event.levelId,
            ),
          );
          return;
        }
        final LevelModel activeLevel = levels.first;
        final List<CourseEntity> courses = activeLevel.courses;

        final double totalProgress = courses.isEmpty
            ? 0.0
            : courses.fold(
                0.0,
                (final double sum, final CourseEntity course) =>
                    sum + course.progress,
              );

        final double levelProgress = courses.isEmpty
            ? 0.0
            : totalProgress / courses.length;
        print('DEBUG: Level Name: ${activeLevel.levelIndex}');
        print('DEBUG: Number of nested courses: ${activeLevel.courses.length}');

        print(
          'DEBUG: Level ${activeLevel.levelIndex} found with ${courses.length} courses',
        );

        emit(
          HomeSuccess(
            courses: courses,
            levelProgress: levelProgress,
            currentLevelId: event.levelId,
          ),
        );
      },
    );
  }
}
