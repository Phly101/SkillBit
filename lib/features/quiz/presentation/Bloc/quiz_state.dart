part of 'quiz_bloc.dart';

sealed class QuizState extends BaseState {
  const QuizState();
}

final class QuizInitial extends QuizState implements InitialState {
  @override
  List<Object> get props => <Object>[];
}

// Quiz Start
final class QuizStartLoading extends QuizState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class QuizStartSuccess extends QuizState
    implements SuccessState<QuizEntity> {
  const QuizStartSuccess({
    required this.quiz,
    this.selectedAnswers = const <int, int>{},
  });

  final QuizEntity quiz;
  final Map<int, int> selectedAnswers;

  QuizStartSuccess copyWith({final Map<int, int>? selectedAnswers}) {
    return QuizStartSuccess(
      quiz: quiz,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }

  @override
  List<Object> get props => <Object>[quiz, selectedAnswers];
}

final class QuizStartError extends QuizState implements ErrorState {
  const QuizStartError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

// Quiz Submit
final class QuizSubmitLoading extends QuizState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class QuizSubmitSuccess extends QuizState
    implements SuccessState<ResultsDetails> {
  const QuizSubmitSuccess({required this.results});

  final ResultsDetails results;

  @override
  List<Object> get props => <Object>[results];
}

final class QuizSubmitError extends QuizState implements ErrorState {
  const QuizSubmitError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

// Quiz Review
final class QuizReviewLoading extends QuizState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class QuizReviewSuccess extends QuizState
    implements SuccessState<ReviewResultEntity> {
  const QuizReviewSuccess({required this.reviewResult});

  final ReviewResultEntity reviewResult;

  @override
  List<Object> get props => <Object>[reviewResult];
}

final class QuizReviewError extends QuizState implements ErrorState {
  const QuizReviewError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
