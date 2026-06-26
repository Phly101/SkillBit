class ReviewQuestionEntity {
  ReviewQuestionEntity({
    required this.question,
    required this.options,
    required this.chosenAnswerIndex,
    required this.correctAnswerIndex,
    required this.correctAnswerHint,
    required this.isCorrect,
  });

  final String question;
  final List<String> options;
  final String chosenAnswerIndex;
  final String correctAnswerIndex;
  final String? correctAnswerHint;
  final bool isCorrect;
}