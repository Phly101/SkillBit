import 'package:equatable/equatable.dart';

class UpdateCourseProgressParams extends Equatable {
  const UpdateCourseProgressParams({required this.courseId, required this.progress});

  final String courseId;
  final double progress;

  @override
  List<Object?> get props => <Object?>[courseId, progress];
}
