import 'package:skill_bit/features/course/data/models/quiz_view_model.dart';

import '../../domain/entities/lesson_entity.dart';

class LessonViewModel extends LessonViewEntity {
  LessonViewModel({
    required super.name,
    required super.id,
    required super.isLocked,
    super.quiz,
  });

  factory LessonViewModel.fromJson(final Map<String, dynamic> json) {
    return LessonViewModel(
      name: json['name'] as String? ?? '',
      id: json['id'] as String? ?? json['_id'] as String? ?? '',
      isLocked: json['isLocked'] as bool? ?? true,
      quiz: json['quiz'] == null
          ? null
          : QuizViewModel.fromJson(json['quiz'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'name': name, 'id': id, 'isLocked': isLocked};
  }
}
