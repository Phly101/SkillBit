part of 'search_course_bloc.dart';

sealed class SearchCourseState extends Equatable {
  const SearchCourseState();
}

final class SearchCourseInitial extends SearchCourseState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchCourseLoading extends SearchCourseState {
  @override
  List<Object> get props => <Object>[];
}
final class SearchCourseClear extends SearchCourseState {
  @override
  List<Object> get props => <Object>[];
}

final class SearchCourseSuccess extends SearchCourseState {
  const SearchCourseSuccess({this.courses});

  final List<SearchCourseEntity>? courses;

  @override
  List<Object> get props => <Object>[courses ?? <dynamic>[]];
}

final class SearchCourseError extends SearchCourseState {
  const SearchCourseError({required this.message});

  final String message;

  @override
  List<Object> get props => <Object>[message];
}
