import 'package:skill_bit/features/course/domain/entities/quiz_view_entity.dart';

class QuizViewModel extends QuizViewEntity {
  QuizViewModel({
    required super.title,
    required super.id,
    required super.icCompleted,
  });

  factory QuizViewModel.fromJson(final Map<String, dynamic> json) {
    return QuizViewModel(
      title: json['title'],
      id: json['id'],
      icCompleted: json['icCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isCompleted': icCompleted,
    };
  }
}
