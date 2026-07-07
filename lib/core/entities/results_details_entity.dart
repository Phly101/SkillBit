class ResultsDetails {
  ResultsDetails({
    required this.wrongAnswers,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.quizScore,
    this.timeTaken,
  });

  final num wrongAnswers;
  final num correctAnswers;
  final num totalQuestions;
  final num quizScore;
  final int? timeTaken;
}
