part of 'course_details_bloc.dart';

sealed class CourseDetailsEvent extends Equatable {
  const CourseDetailsEvent();
}
class LoadCourseDetails extends CourseDetailsEvent {
  const LoadCourseDetails({required this.courseId});

  final String courseId;

  @override
  List<Object?> get props => <Object?>[courseId];
}