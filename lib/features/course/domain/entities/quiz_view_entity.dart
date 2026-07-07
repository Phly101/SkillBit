import 'enums/quiz_status.dart';

class QuizViewEntity {
  QuizViewEntity({
    required this.title,
    required this.id,
    required this.isLocked,
    required this.status,
    this.difficulty,
    this.timeLimit,
    this.passingScore,
  });

  final String title;
  final String id;
  final bool isLocked;
  final QuizStatus status;
  final String? difficulty;
  final int? timeLimit;
  final int? passingScore;
}
