import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/bloc/base_state.dart';
import 'package:skill_bit/features/course/domain/useCases/course_usecase_index.dart';
import 'package:skill_bit/features/course/domain/useCases/homeFetching/fetch_courses_by_level_use_case.dart';

//import 'package:skill_bit/features/course/domain/useCases/homeFetching/get_level_road_map.dart';
import 'package:skill_bit/features/course/domain/useCases/progressTracking/get_course_progress.dart';
import 'package:skill_bit/features/course/domain/useCases/progressTracking/update_course_progress.dart';

import '../../../data/models/level_model.dart';

part 'course_event.dart';

part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc({
    required this.fetchCoursesByLevelUseCase,
    // required this.getLevelRoadMapUseCase,
    required this.getCourseProgressUseCase,
    required this.updateCourseProgressUseCase,
  }) : super(CourseInitial()) {
    on<FetchCoursesByLevel>(_fetchCourses);
    on<UpdateCourseProgressEvent>(_onUpdateProgress);
  }

  final FetchCoursesByLevelUseCase fetchCoursesByLevelUseCase;

  // final GetLevelRoadMapUseCase getLevelRoadMapUseCase;
  final GetCourseProgressUseCase getCourseProgressUseCase;
  final UpdateCourseProgressUseCase updateCourseProgressUseCase;

  //Todo: things will change when the backend goes live
  Future<void> _fetchCourses(
    final FetchCoursesByLevel event,
    final Emitter<CourseState> emit,
  ) async {
    if (event.levelId.isEmpty) {
      emit(CourseInitial());
      return;
    }
    emit(CoursesLoading());
    final Either<Failure, List<LevelModel>> result =
        await fetchCoursesByLevelUseCase(IdParams(id: event.levelId));
    result.fold(
      (final Failure failure) => emit(
        const CourseError(message: 'Failed to fetch Courses from memory'),
      ),
      (final List<LevelModel> levels) {
        if (levels.isEmpty) {
          emit(
            const CoursesSuccess(courses: <CourseEntity>[], levelProgress: 0.0),
          );
          return;
        }

        final LevelModel activeLevel = levels.firstWhere(
          (final LevelModel l) => l.id == event.levelId,
          orElse: () => levels.first,
        );
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

        print(
          'DEBUG: Level ${activeLevel.levelIndex} found with ${courses.length} courses',
        );

        emit(CoursesSuccess(courses: courses, levelProgress: levelProgress));
      },
    );
  }

  //  Updating Progress
  Future<void> _onUpdateProgress(
    final UpdateCourseProgressEvent event,
    final Emitter<CourseState> emit,
  ) async {
    final Either<Failure, Unit> result = await updateCourseProgressUseCase(
      UpdateCourseProgressParams(
        courseId: event.courseId,
        progress: event.progress,
      ),
    );

    result.fold(
      (final Failure failure) =>
          emit(const CourseError(message: 'could not update progress')),
      (_) {
        //   emit(LessonOperationSuccess());
        if (event.progress >= 1.0) emit(CourseCompleted());
      },
    );
  }
}
