part of 'search_course_bloc.dart';

sealed class SearchCourseEvent extends Equatable {
  const SearchCourseEvent();
}

class SearchCourseUpdated extends SearchCourseEvent {
  const SearchCourseUpdated(this.query);

  final String query;

  @override
  List<Object?> get props => <Object?>[query];
}

class SearchCourseCleared extends SearchCourseEvent {
  @override
  List<Object?> get props => <Object?>[];
}
