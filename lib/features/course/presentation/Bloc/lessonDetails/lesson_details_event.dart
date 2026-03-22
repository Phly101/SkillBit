part of 'lesson_details_bloc.dart';

sealed class LessonDetailsEvent extends Equatable {
  const LessonDetailsEvent();
}

class LoadLessonDetails extends LessonDetailsEvent {
  const LoadLessonDetails({required this.lessonId, required this.courseId});

  final String lessonId;
  final String courseId;

  @override
  List<Object?> get props => <Object?>[lessonId, courseId];
}

class WatchVideoEvent extends LessonDetailsEvent {
  const WatchVideoEvent({
    required this.videoId,
    required this.lessonId,
    required this.courseId,
    required this.url,
  });

  final String videoId;
  final String lessonId;
  final String courseId;
  final String url;

  @override
  List<Object?> get props => <Object?>[videoId, lessonId, courseId];
}

class VisitArticleEvent extends LessonDetailsEvent {
  const VisitArticleEvent({
    required this.articleId,
    required this.lessonId,
    required this.courseId,
    required this.url,
  });

  final String articleId;
  final String lessonId;
  final String courseId;
  final String url;

  @override
  List<Object?> get props => <Object?>[articleId, lessonId, courseId];
}

class LessonActionFailure extends LessonDetailsState implements ErrorState {
  const LessonActionFailure({required this.message});

  @override
  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}
