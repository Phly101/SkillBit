import 'package:equatable/equatable.dart';

class LessonParams extends Equatable {
  const LessonParams({required this.lessonId, required this.courseId});

  final String lessonId;
  final String courseId;

  @override
  List<Object?> get props => <Object?>[lessonId, courseId];
}
