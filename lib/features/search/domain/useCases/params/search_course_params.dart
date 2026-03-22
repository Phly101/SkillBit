import 'package:equatable/equatable.dart';

class SearchCourseParams extends Equatable {
  const SearchCourseParams(this.query);

  final String query;

  @override
  List<Object?> get props => <Object?>[query];
}
