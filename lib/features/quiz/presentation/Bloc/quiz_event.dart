part of 'quiz_bloc.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class QuizStartRequested extends QuizEvent {
  const QuizStartRequested({required this.quizId});

  final String quizId;

  @override
  List<Object?> get props => <Object?>[quizId];
}

class QuizSubmitRequested extends QuizEvent {
  const QuizSubmitRequested({required this.answers});

  final SendAnswers answers;

  @override
  List<Object?> get props => <Object?>[answers];
}

class QuizReviewRequested extends QuizEvent {
  const QuizReviewRequested({required this.quizId});

  final String quizId;

  @override
  List<Object?> get props => <Object?>[quizId];
}

class QuizAnswerSelected extends QuizEvent {
  const QuizAnswerSelected({
    required this.questionIndex,
    required this.optionIndex,
  });

  final int questionIndex;
  final int optionIndex;

  @override
  List<Object?> get props => <Object?>[questionIndex, optionIndex];
}
