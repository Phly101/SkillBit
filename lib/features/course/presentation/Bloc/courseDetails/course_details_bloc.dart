import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/bloc/base_state.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/course/domain/useCases/activeLearingActions/enroll_course.dart';
import 'package:skill_bit/features/course/domain/useCases/activeLearingActions/finish_course.dart';
import 'package:skill_bit/features/course/domain/useCases/coursePageFetching/get_course_details.dart';
import 'package:skill_bit/features/course/domain/useCases/params/course_params.dart';


part 'course_details_event.dart';

part 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsBloc({
    required this.getCourseDetailsUseCase,
    required this.enrollCourseUseCase,
    required this.finishCourseUseCase,
  }) : super(CourseDetailsInitial()) {
    on<LoadCourseDetails>(_onLoadCourseDetails);
    on<EnrollCourseEvent>(_onEnrollCourse);
  }

  final GetCourseDetailsUseCase getCourseDetailsUseCase;
  final EnrollCourse enrollCourseUseCase;
  final FinishCourse finishCourseUseCase;

  //  Loading the Lessons for one Course
  Future<void> _onLoadCourseDetails(
    final LoadCourseDetails event,
    final Emitter<CourseDetailsState> emit,
  ) async {
    emit(CourseDetailsLoading());
    final Either<Failure, CourseDetailsEntity> result =
        await getCourseDetailsUseCase(CourseParams(courseId: event.courseId));

    result.fold(
      (final Failure failure) => emit(
        const CourseDetailsError(message: 'could not get course details'),
      ),
      (final CourseDetailsEntity course) =>
          emit(CourseDetailSuccess(course: course)),
    );
  }

  Future<void> _onEnrollCourse(
      final EnrollCourseEvent event,
      final Emitter<CourseDetailsState> emit,
      ) async {
    final Either<Failure, void> result = await enrollCourseUseCase(
      CourseParams(courseId: event.courseId),
    );

    final CourseDetailsState currentState = state;

    result.fold((final Failure failure) {
      if (failure is AlreadyEnrolledFailure && currentState is CourseDetailSuccess) {
        emit(CourseDetailSuccess(course: currentState.course.copyWith(isEnrolled: true)));
      } else {
        emit(const EnrollCourseError(message: 'could not enroll in course'));
      }
    }, (final _) {
      if (currentState is CourseDetailSuccess) {
        emit(CourseDetailSuccess(course: currentState.course.copyWith(isEnrolled: true)));
      } else {
        add(LoadCourseDetails(courseId: event.courseId));
      }
    });
  }
}
