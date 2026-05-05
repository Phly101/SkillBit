import 'package:equatable/equatable.dart';

class LessonParams extends Equatable {
  const LessonParams({required this.lessonId, required this.courseId});

  final String lessonId;
  //Todo: remove course id it's not needed
  final String courseId;

  @override
  List<Object?> get props => <Object?>[lessonId, courseId];
}
