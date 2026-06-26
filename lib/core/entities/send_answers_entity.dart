class SendAnswers {
  SendAnswers({
    required this.quizId,
    required this.answers,
    required this.timeTaken,
  });

  final String quizId;
  final List<String> answers;
  final Duration timeTaken;
}
