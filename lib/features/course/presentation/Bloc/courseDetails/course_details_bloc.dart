import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/bloc/base_state.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/useCases/params/id_params.dart';
import '../../../domain/entities/course_entity.dart';
import '../../../domain/useCases/coursePageFetching/get_course_details.dart';

part 'course_details_event.dart';

part 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsBloc({required this.getCourseDetailsUseCase})
    : super(CourseDetailsInitial()) {
    on<LoadCourseDetails>(_onLoadCourseDetails);
  }

  final GetCourseDetailsUseCase getCourseDetailsUseCase;

  //  Loading the Lessons for one Course
  Future<void> _onLoadCourseDetails(
    final LoadCourseDetails event,
    final Emitter<CourseDetailsState> emit,
  ) async {
    emit(CourseDetailsLoading());
    final Either<Failure, CourseEntity> result = await getCourseDetailsUseCase(
      IdParams(id: event.courseId),
    );

    result.fold(
      (final Failure failure) => emit(
        const CourseDetailsError(message: 'could not get course details'),
      ),
      (final CourseEntity course) => emit(CourseDetailSuccess(course: course)),
    );
  }
}
