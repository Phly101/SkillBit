import 'package:equatable/equatable.dart';

class CourseParams extends Equatable {
  const CourseParams({required this.courseId});

  final String courseId;

  @override
  List<Object?> get props => <Object?>[courseId];
}
