part of 'course_bloc.dart';

sealed class CourseEvent extends Equatable {
  const CourseEvent();
}

// class FetchRoadMap extends CourseEvent {
//   @override
//   List<Object?> get props => <Object?>[];
// }

class FetchCoursesByLevel extends CourseEvent {
  const FetchCoursesByLevel({required this.levelId});

  final String levelId;

  @override
  List<Object?> get props => <Object?>[levelId];
}

class UpdateCourseProgressEvent extends CourseEvent {
  const UpdateCourseProgressEvent({required this.courseId, required this.progress});

  final String courseId;
  final double progress;

  @override
  List<Object?> get props => <Object?>[courseId, progress];
}
class GetCourseProgressEvent extends CourseEvent {
  const GetCourseProgressEvent({required this.courseId});

  final String courseId;


  @override
  List<Object?> get props => <Object?>[courseId];
}

