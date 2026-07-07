import 'package:equatable/equatable.dart';

class LessonParams extends Equatable {
  const LessonParams({required this.lessonId});

  final String lessonId;

  @override
  List<Object?> get props => <Object?>[lessonId];
}
