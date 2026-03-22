import 'package:skill_bit/core/enums/question_difficulty.dart';

class QuestionEntity {
  QuestionEntity({
    required this.id,
    required this.title,
    required this.options,
    required this.questionDifficulty,
    this.correctAnswerIndex,
    this.selectedAnswerIndex,
  });

  final String id;
  final String title;
  final List<String> options;
  final int? correctAnswerIndex;
  final QuestionDifficulty questionDifficulty;
  int? selectedAnswerIndex;
}
