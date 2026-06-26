part of 'contest_bloc.dart';

sealed class ContestState extends BaseState {
  const ContestState();
}

final class ContestInitial extends ContestState {
  @override
  List<Object> get props => <Object>[];
}

// Todo: leaderboard loading leaderboardSuccess leaderboardError

// contest details
final class ContestDetailsLoading extends ContestState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class ContestDetailsSuccess extends ContestState
    implements SuccessState<ContestDetailsEntity> {
  const ContestDetailsSuccess({required this.contestDetails});

  final ContestDetailsEntity contestDetails;

  @override
  List<Object> get props => <Object>[contestDetails];
}

final class ContestDetailsError extends ContestState implements ErrorState {
  const ContestDetailsError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

//-----------------------------------------------------------------------------------------------
// contest start
final class ContestStartLoading extends ContestState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class ContestStartSuccess extends ContestState
    implements SuccessState<QuizEntity> {
  const ContestStartSuccess({
    required this.contest,
    this.selectedAnswers = const <int, int>{},
  });

  final QuizEntity contest;
  final Map<int, int> selectedAnswers;

  ContestStartSuccess copyWith({final Map<int, int>? selectedAnswers}) {
    return ContestStartSuccess(
      contest: contest,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }

  @override
  List<Object> get props => <Object>[contest, selectedAnswers];
}

final class ContestStartError extends ContestState implements ErrorState {
  const ContestStartError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}
//-----------------------------------------------------------------------------------------------

// contest Submit
final class ContestSubmitLoading extends ContestState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class ContestSubmitSuccess extends ContestState
    implements SuccessState<ResultsDetails> {
  const ContestSubmitSuccess({required this.results});

  final ResultsDetails results;

  @override
  List<Object> get props => <Object>[results];
}

final class ContestSubmitError extends ContestState implements ErrorState {
  const ContestSubmitError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

//-----------------------------------------------------------------------------------------------

// contest Review
final class ContestReviewLoading extends ContestState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class ContestReviewSuccess extends ContestState
    implements SuccessState<ReviewResultEntity> {
  const ContestReviewSuccess({required this.reviewResult});

  final ReviewResultEntity reviewResult;

  @override
  List<Object> get props => <Object>[reviewResult];
}

final class ContestReviewError extends ContestState implements ErrorState {
  const ContestReviewError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

//-----------------------------------------------------------------------------------------------
final class LeaderboardLoading extends ContestState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class LeaderBoardSuccess extends ContestState
    implements SuccessState<LeaderboardResponseEntity> {
  const LeaderBoardSuccess({required this.leaderboardResponse});

  final LeaderboardResponseEntity leaderboardResponse;

  @override
  List<Object> get props => <Object>[leaderboardResponse];
}

final class LeaderBoardError extends ContestState implements ErrorState {
  const LeaderBoardError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

//-----------------------------------------------------------------------------------------------
final class ContestResultsLoading extends ContestState implements LoadingState {
  @override
  List<Object> get props => <Object>[];
}

final class ContestResultsSuccess extends ContestState
    implements SuccessState<ContestResultsEntity> {
  const ContestResultsSuccess({required this.leaderboardResponse});

  final ContestResultsEntity leaderboardResponse;

  @override
  List<Object> get props => <Object>[leaderboardResponse];
}

final class ContestResultsError extends ContestState implements ErrorState {
  const ContestResultsError({required this.message});

  @override
  final String message;

  @override
  List<Object> get props => <Object>[message];
}

class ContestLeaderboardPageSuccess extends ContestState
    implements SuccessState {
  const ContestLeaderboardPageSuccess({
    required this.top3,
    required this.myResult,
    required this.leaderboard,
  });

  final List<TopThreeEntity> top3;
  final MyResultEntity myResult;
  final List<LeaderboardEntity> leaderboard;
  @override
  List<Object> get props => <Object>[top3, myResult, leaderboard];
}



