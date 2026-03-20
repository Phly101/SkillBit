part of 'course_bloc.dart';

sealed class CourseEvent extends Equatable {
  const CourseEvent();
}

class FetchRoadMap extends CourseEvent {
  @override
  List<Object?> get props => <Object?>[];
}

class LoadCourseDetails extends CourseEvent {
  const LoadCourseDetails({required this.courseId});

  final String courseId;

  @override
  List<Object?> get props => <Object?>[courseId];
}

class LoadLessonDetails extends CourseEvent {
  const LoadLessonDetails({required this.lessonId, required this.courseId});

  final String lessonId;
  final String courseId;

  @override
  List<Object?> get props => <Object?>[lessonId, courseId];
}

class FetchCoursesByLevel extends CourseEvent {
  const FetchCoursesByLevel({required this.levelId});

  final String levelId;

  @override
  List<Object?> get props => <Object?>[levelId];
}

class WatchVideoEvent extends CourseEvent {
  const WatchVideoEvent({
    required this.videoId,
    required this.lessonId,
    required this.courseId,
  });

  final String videoId;
  final String lessonId;
  final String courseId;

  @override
  List<Object?> get props => <Object?>[videoId, lessonId, courseId];
}

class VisitArticleEvent extends CourseEvent {
  const VisitArticleEvent({
    required this.articleId,
    required this.lessonId,
    required this.courseId,
  });

  final String articleId;
  final String lessonId;
  final String courseId;

  @override
  List<Object?> get props => <Object?>[articleId, lessonId, courseId];
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

