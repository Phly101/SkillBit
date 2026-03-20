import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/bloc/base_state.dart';
import 'package:skill_bit/features/course/domain/useCases/activeLearingActions/visit_article.dart';
import 'package:skill_bit/features/course/domain/useCases/activeLearingActions/watch_video.dart';
import 'package:skill_bit/features/course/domain/useCases/coursePageFetching/get_course_details.dart';
import 'package:skill_bit/features/course/domain/useCases/coursePageFetching/get_lesson_details.dart';
import 'package:skill_bit/features/course/domain/useCases/course_usecase_index.dart';
import 'package:skill_bit/features/course/domain/useCases/homeFetching/fetch_courses_by_level_use_case.dart';
import 'package:skill_bit/features/course/domain/useCases/homeFetching/get_level_road_map.dart';
import 'package:skill_bit/features/course/domain/useCases/progressTracking/get_course_progress.dart';
import 'package:skill_bit/features/course/domain/useCases/progressTracking/update_course_progress.dart';

import '../../data/models/level_model.dart';

part 'course_event.dart';

part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc({
    required this.fetchCoursesByLevelUseCase,
    required this.getLevelRoadMapUseCase,
    required this.getCourseProgressUseCase,
    required this.updateCourseProgressUseCase,
    required this.getCourseDetailsUseCase,
    required this.getLessonDetailsUseCase,
    required this.visitArticleUseCase,
    required this.watchVideoUseCase,
  }) : super(CourseInitial()) {
    on<FetchCoursesByLevel>(_fetchCourses);
    on<LoadCourseDetails>(_onLoadCourseDetails);
    on<LoadLessonDetails>(_onLoadLessonDetails);
    on<UpdateCourseProgressEvent>(_onUpdateProgress);
    on<WatchVideoEvent>(_onWatchVideo);
    on<VisitArticleEvent>(_onVisitArticle);
  }

  final FetchCoursesByLevelUseCase fetchCoursesByLevelUseCase;
  final GetLevelRoadMapUseCase getLevelRoadMapUseCase;
  final GetCourseProgressUseCase getCourseProgressUseCase;
  final UpdateCourseProgressUseCase updateCourseProgressUseCase;
  final GetCourseDetailsUseCase getCourseDetailsUseCase;
  final GetLessonDetailsUseCase getLessonDetailsUseCase;
  final VisitArticleUseCase visitArticleUseCase;
  final WatchVideoUseCase watchVideoUseCase;

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

  //  Loading the Lessons for one Course
  Future<void> _onLoadCourseDetails(
    final LoadCourseDetails event,
    final Emitter<CourseState> emit,
  ) async {
    emit(CoursesLoading());
    final Either<Failure, CourseEntity> result = await getCourseDetailsUseCase(
      IdParams(id: event.courseId),
    );

    result.fold(
      (final Failure failure) =>
          emit(const CourseError(message: 'could not get course details')),
      (final CourseEntity course) => emit(CourseDetailSuccess(course: course)),
    );
  }

  //  Loading a specific Lesson
  Future<void> _onLoadLessonDetails(
    final LoadLessonDetails event,
    final Emitter<CourseState> emit,
  ) async {
    emit(CoursesLoading());
    final Either<Failure, LessonEntity> result = await getLessonDetailsUseCase(
      LessonParams(courseId: event.courseId, lessonId: event.lessonId),
    );

    result.fold(
      (final Failure failure) =>
          emit(const CourseError(message: 'could not get lesson details')),
      (final LessonEntity lesson) => emit(LessonDetailSuccess(lesson: lesson)),
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
        emit(LessonOperationSuccess());
        if (event.progress >= 1.0) emit(CourseCompleted());
      },
    );
  }

  // Video
  Future<void> _onWatchVideo(
    final WatchVideoEvent event,
    final Emitter<CourseState> emit,
  ) async {
    final Either<Failure, Unit> result = await watchVideoUseCase(
      ResourceParams(
        id: event.videoId,
        lessonId: event.lessonId,
        courseId: event.courseId,
      ),
    );

    result.fold(
      (final Failure failure) =>
          emit(const CourseError(message: 'could not load video')),
      (_) => emit(LessonOperationSuccess()),
    );
  }

  //  Article
  Future<void> _onVisitArticle(
    final VisitArticleEvent event,
    final Emitter<CourseState> emit,
  ) async {
    final Either<Failure, Unit> result = await visitArticleUseCase(
      ResourceParams(
        id: event.articleId,
        lessonId: event.lessonId,
        courseId: event.courseId,
      ),
    );

    result.fold(
      (final Failure failure) =>
          emit(const CourseError(message: 'could not load website')),
      (_) => emit(LessonOperationSuccess()),
    );
  }
}
