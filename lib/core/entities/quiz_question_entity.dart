class QuizQuestionEntity {
  QuizQuestionEntity({
    required this.question,
    required this.options,
    this.correctAnswerIndex,
    this.correctAnswerHint,
  });

  final String question;
  final List<String> options;
  final int? correctAnswerIndex;
  final String? correctAnswerHint;
}
