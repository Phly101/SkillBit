import 'package:skill_bit/features/quiz/domain/entities/quiz_entity.dart';

class QuizModel extends QuizEntity {
  QuizModel({
    required super.id,
    required super.title,
    required super.isCompleted,
    required super.duration,
    required super.questions,
    required super.isPassed,
    super.score,
    super.completedAt,
  });

  factory QuizModel.fromJson(final Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
      duration: json['duration'],
      questions: json['questions'],
      isPassed: json['isPassed'],
      score: json['score'],
      completedAt: json['completedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'duration': duration,
      'questions': questions,
      'isPassed': isPassed,
      'score': score,
      'completedAt': completedAt,
    };
  }
}
