part of 'course_details_bloc.dart';

sealed class CourseDetailsState extends BaseState {
  const CourseDetailsState();
}

final class CourseDetailsInitial extends CourseDetailsState
    implements InitialState {
  @override
  List<Object> get props => <Object>[];
}

final class CourseDetailsLoading extends CourseDetailsState
    implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class CourseDetailSuccess extends CourseDetailsState
    implements SuccessState<dynamic> {
  const CourseDetailSuccess({required this.course});

  final CourseDetailsEntity course;

  @override
  List<Object> get props => <Object>[course];
}

final class CourseDetailsError extends CourseDetailsState
    implements ErrorState {
  const CourseDetailsError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

final class EnrollCourseSuccess extends CourseDetailsState
    implements SuccessState<dynamic> {
  const EnrollCourseSuccess();

  @override
  List<Object> get props => <Object>[];
}

final class EnrollCourseError extends CourseDetailsState implements ErrorState {
  const EnrollCourseError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

final class FinishCourseSuccess extends CourseDetailsState
    implements SuccessState<dynamic> {
  const FinishCourseSuccess();

  @override
  List<Object> get props => <Object>[];
}

final class FinishCourseError extends CourseDetailsState implements ErrorState {
  const FinishCourseError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
