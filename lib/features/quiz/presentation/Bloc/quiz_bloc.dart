import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base_state.dart';
import '../../../../core/entities/results_details_entity.dart';
import '../../../../core/entities/review_results_entity.dart';
import '../../../../core/entities/send_answers_entity.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/entities/quiz_entity.dart';
import '../../domain/useCases/params/quiz_params.dart';
import '../../domain/useCases/params/review_params.dart';
import '../../domain/useCases/params/send_params.dart';
import '../../domain/useCases/review_answers.dart';
import '../../domain/useCases/start_quiz.dart';
import '../../domain/useCases/submit_quiz.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({
    required this.attemptQuiz,
    required this.submitQuiz,
    required this.reviewAnswers,
  }) : super(QuizInitial()) {
    on<QuizStartRequested>(_onQuizStartRequested);
    on<QuizSubmitRequested>(_onQuizSubmitRequested);
    on<QuizReviewRequested>(_onQuizReviewRequested);
    on<QuizAnswerSelected>(_onQuizAnswerSelected);
  }

  final AttemptQuiz attemptQuiz;
  final SubmitQuiz submitQuiz;
  final ReviewAnswers reviewAnswers;

  void _onQuizAnswerSelected(
    final QuizAnswerSelected event,
    final Emitter<QuizState> emit,
  ) {
    if (state is QuizStartSuccess) {
      final QuizStartSuccess currentState = state as QuizStartSuccess;
      final Map<int, int> updatedAnswers = Map<int, int>.from(
        currentState.selectedAnswers,
      );
      updatedAnswers[event.questionIndex] = event.optionIndex;
      emit(currentState.copyWith(selectedAnswers: updatedAnswers));
    }
  }

  Future<void> _onQuizStartRequested(
    final QuizStartRequested event,
    final Emitter<QuizState> emit,
  ) async {
    emit(QuizStartLoading());
    final Either<Failure, QuizEntity> result = await attemptQuiz(
      QuizParams(id: event.quizId),
    );
    result.fold(
      (final Failure failure) =>
          emit(const QuizStartError(message: 'Failed to start quiz')),
      (final QuizEntity quiz) => emit(QuizStartSuccess(quiz: quiz)),
    );
  }

  Future<void> _onQuizSubmitRequested(
    final QuizSubmitRequested event,
    final Emitter<QuizState> emit,
  ) async {
    emit(QuizSubmitLoading());
    final Either<Failure, ResultsDetails> result = await submitQuiz(
      SendParams(answers: event.answers),
    );
    result.fold(
      (final Failure failure) =>
          emit(const QuizSubmitError(message: 'Failed to submit quiz')),
      (final ResultsDetails results) =>
          emit(QuizSubmitSuccess(results: results)),
    );
  }

  Future<void> _onQuizReviewRequested(
    final QuizReviewRequested event,
    final Emitter<QuizState> emit,
  ) async {
    emit(QuizReviewLoading());
    final Either<Failure, ReviewResultEntity> result = await reviewAnswers(
      ReviewParams(quizId: event.quizId),
    );
    result.fold(
      (final Failure failure) =>
          emit(const QuizReviewError(message: 'Failed to review quiz')),
      (final ReviewResultEntity reviewResult) =>
          emit(QuizReviewSuccess(reviewResult: reviewResult)),
    );
  }
}
