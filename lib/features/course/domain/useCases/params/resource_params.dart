import 'package:equatable/equatable.dart';

class ResourceParams extends Equatable {
  const ResourceParams({
    required this.id,
    required this.lessonId,
    required this.courseId,
  });

  final String id;
  final String lessonId;
  final String courseId;

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[id, lessonId, courseId];
}
