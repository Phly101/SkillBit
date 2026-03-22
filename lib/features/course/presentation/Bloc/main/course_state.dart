part of 'course_bloc.dart';

sealed class CourseState extends BaseState {
  const CourseState();
}

final class CourseInitial extends CourseState implements InitialState {
  @override
  List<Object> get props => <Object>[];
}

final class CoursesLoading extends CourseState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class CoursesSuccess extends CourseState
    implements SuccessState<dynamic> {
  const CoursesSuccess({required this.courses, required this.levelProgress});

  final List<CourseEntity> courses;
  final double levelProgress;

  @override
  List<Object> get props => <Object>[courses, levelProgress];
}

final class CourseError extends CourseState implements ErrorState {
  const CourseError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

final class CourseCompleted extends CourseState {
  @override
  List<Object> get props => <Object>[];
}

final class LevelCompleted extends CourseState {
  @override
  List<Object> get props => <Object>[];
}
