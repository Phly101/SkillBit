import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skill_bit/core/entities/quiz_entity.dart';
import 'package:skill_bit/core/entities/results_details_entity.dart';
import 'package:skill_bit/core/entities/review_results_entity.dart';
import 'package:skill_bit/core/entities/send_answers_entity.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/core/useCases/use_cases.dart';
import 'package:skill_bit/features/contests/domain/entities/contest_details_entity.dart';
import 'package:skill_bit/features/contests/domain/entities/contest_results_entity.dart';
import 'package:skill_bit/features/contests/domain/entities/leaderboard_response_entity.dart';
import 'package:skill_bit/features/contests/domain/useCases/get_contest_results.dart';
import 'package:skill_bit/features/contests/domain/useCases/get_leaderboard.dart';
import 'package:skill_bit/features/contests/domain/useCases/params/contest_params.dart';
import 'package:skill_bit/features/quiz/domain/useCases/params/review_params.dart';
import 'package:skill_bit/features/quiz/domain/useCases/params/send_params.dart';
import '../../../../core/bloc/base_state.dart';
import '../../domain/entities/leaderboard_entity.dart';
import '../../domain/entities/my_results_entity.dart';
import '../../domain/entities/podium_entity.dart';
import '../../domain/useCases/contest_start.dart';
import '../../domain/useCases/contest_submit.dart';
import '../../domain/useCases/get_contest_details.dart';
import '../../domain/useCases/review_contest_answers.dart';

part 'contest_event.dart';

part 'contest_state.dart';

class ContestBloc extends Bloc<ContestEvent, ContestState> {
  ContestBloc({
    required this.getDetailsUseCase,
    required this.startContestUseCase,
    required this.submitContestUseCase,
    required this.reviewContestUseCase,
    required this.getLeaderBoardData,
    required this.getContestResults,
  }) : super(ContestInitial()) {
    on<ContestDetailsRequested>(_onDetailsRequested);
    on<ContestStartRequested>(_onStartRequested);
    on<ContestAnswerSelected>(_onAnswerSelected);
    on<ContestSubmitRequested>(_onSubmitRequested);
    on<ContestReviewRequested>(_onReviewRequested);
    on<LeaderBoardDetailsRequested>(_onLeaderBoardRequested);
    on<ContestResultsRequested>(_onContestResultsRequested);
    on<ContestLeaderboardPageRequested>(_onLeaderboardPageRequested);
  }

  final GetContestDetails getDetailsUseCase;
  final ContestStart startContestUseCase;
  final ContestSubmit submitContestUseCase;
  final ReviewContestAnswers reviewContestUseCase;
  final GetLeaderBoardData getLeaderBoardData;
  final GetContestResults getContestResults;


  // 1. Fetch Details
  Future<void> _onDetailsRequested(
    final ContestDetailsRequested event,
    final Emitter<ContestState> emit,
  ) async {
    emit(ContestDetailsLoading());
    final Either<Failure, ContestDetailsEntity> result =
        await getDetailsUseCase(const NoParams());
    result.fold(
      (final Failure f) =>
          emit(const ContestDetailsError(message: 'Contest Details Error')),
      (final ContestDetailsEntity details) =>
          emit(ContestDetailsSuccess(contestDetails: details)),
    );
  }

  // 2. Start Contest
  Future<void> _onStartRequested(
    final ContestStartRequested event,
    final Emitter<ContestState> emit,
  ) async {
    emit(ContestStartLoading());
    final Either<Failure, QuizEntity> result = await startContestUseCase(
      ContestParams(id: event.contestId),
    );
    result.fold(
      (final Failure f) =>
          emit(const ContestStartError(message: 'Start Error')),
      (final QuizEntity quiz) => emit(ContestStartSuccess(contest: quiz)),
    );
  }

  // 3. Local State Management for Answers
  void _onAnswerSelected(
    final ContestAnswerSelected event,
    final Emitter<ContestState> emit,
  ) {
    if (state is ContestStartSuccess) {
      final ContestStartSuccess currentState = state as ContestStartSuccess;
      final Map<int, int> updatedAnswers = Map<int, int>.from(
        currentState.selectedAnswers,
      );
      updatedAnswers[event.questionIndex] = event.optionIndex;
      emit(currentState.copyWith(selectedAnswers: updatedAnswers));
    }
  }

  // 4. Submit Answers
  Future<void> _onSubmitRequested(
    final ContestSubmitRequested event,
    final Emitter<ContestState> emit,
  ) async {
    emit(ContestSubmitLoading());
    final Either<Failure, ResultsDetails> result = await submitContestUseCase(
      SendParams(answers: event.answers),
    );
    result.fold(
      (final Failure f) =>
          emit(const ContestSubmitError(message: 'Submit Error')),
      (final ResultsDetails results) =>
          emit(ContestSubmitSuccess(results: results)),
    );
  }

  // 5. Review Results
  Future<void> _onReviewRequested(
    final ContestReviewRequested event,
    final Emitter<ContestState> emit,
  ) async {
    emit(ContestReviewLoading());
    final Either<Failure, ReviewResultEntity> result =
        await reviewContestUseCase(ReviewParams(quizId: event.contestId));
    result.fold(
      (final Failure f) =>
          emit(const ContestReviewError(message: 'Review Error')),
      (final ReviewResultEntity review) =>
          emit(ContestReviewSuccess(reviewResult: review)),
    );
  }

  Future<void> _onLeaderBoardRequested(
    final LeaderBoardDetailsRequested event,
    final Emitter<ContestState> emit,
  ) async {
    emit(LeaderboardLoading());
    final Either<Failure, LeaderboardResponseEntity> result =
        await getLeaderBoardData(const NoParams());
    result.fold(
      (final Failure f) =>
          emit(const LeaderBoardError(message: 'Leaderboard Error')),
      (final LeaderboardResponseEntity review) =>
          emit(LeaderBoardSuccess(leaderboardResponse: review)),
    );
  }

  Future<void> _onContestResultsRequested(
    final ContestResultsRequested event,
    final Emitter<ContestState> emit,
  ) async {
    emit(ContestResultsLoading());
    final Either<Failure, ContestResultsEntity> result =
        await getContestResults(ContestParams(id: event.contestId));
    result.fold(
      (final Failure f) =>
          emit(const ContestResultsError(message: 'Contest Results Error')),
      (final ContestResultsEntity review) =>
          emit(ContestResultsSuccess(leaderboardResponse: review)),
    );
  }

  Future<void> _onLeaderboardPageRequested(
    final ContestLeaderboardPageRequested event,
    final Emitter<ContestState> emit,
  ) async {
    emit(LeaderboardLoading());

    final Either<Failure, ContestResultsEntity> resultsEither =
        await getContestResults(ContestParams(id: event.contestId));

    await resultsEither.fold(
      (final Failure f) async =>
          emit(const LeaderBoardError(message: 'Leaderboard Error')),
      (final ContestResultsEntity results) async {
        final Either<Failure, LeaderboardResponseEntity> leaderboardEither =
            await getLeaderBoardData(const NoParams());

        leaderboardEither.fold(
          (final Failure f) =>
              emit(const LeaderBoardError(message: 'Leaderboard Error')),
          (final LeaderboardResponseEntity leaderboard) => emit(
            ContestLeaderboardPageSuccess(
              top3: results.top3,
              myResult: results.myResult,
              leaderboard: leaderboard.leaderboard,
            ),
          ),
        );
      },
    );
  }


}
