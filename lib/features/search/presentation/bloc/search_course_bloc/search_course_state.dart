part of 'search_course_bloc.dart';

sealed class SearchCourseState extends BaseState {
  const SearchCourseState();
}

final class SearchCourseInitial extends SearchCourseState
    implements InitialState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchCourseLoading extends SearchCourseState
    implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchCourseClear extends SearchCourseState implements ClearState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchCourseSuccess extends SearchCourseState
    implements SuccessState<List<CourseEntity>> {
  const SearchCourseSuccess({required this.courses});

  final List<CourseEntity> courses;



  @override
  List<Object?> get props => <Object?>[courses];
}

final class SearchCourseError extends SearchCourseState implements ErrorState {
  const SearchCourseError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
