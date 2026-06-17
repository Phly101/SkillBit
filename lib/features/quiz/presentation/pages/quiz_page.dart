import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({
    super.key,
    required this.courseId,
    required this.quizId,
    required this.lessonId,
  });

  final String? courseId;
  final String? quizId;
  final String? lessonId;

  @override
  Widget build(final BuildContext context) {
    return const Placeholder();
  }
}
