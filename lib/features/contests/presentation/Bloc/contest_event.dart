part of 'contest_bloc.dart';

sealed class ContestEvent extends Equatable {
  const ContestEvent();
}

//Todo: leaderboard details requested
class ContestDetailsRequested extends ContestEvent {
  const ContestDetailsRequested();

  @override
  List<Object?> get props => <Object?>[];
}

class ContestStartRequested extends ContestEvent {
  const ContestStartRequested({required this.contestId});

  final String contestId;

  @override
  List<Object?> get props => <Object?>[contestId];
}

class ContestSubmitRequested extends ContestEvent {
  const ContestSubmitRequested({required this.answers});

  final SendAnswers answers;

  @override
  List<Object?> get props => <Object?>[answers];
}

class ContestReviewRequested extends ContestEvent {
  const ContestReviewRequested({required this.contestId});

  final String contestId;

  @override
  List<Object?> get props => <Object?>[contestId];
}

class ContestAnswerSelected extends ContestEvent {
  const ContestAnswerSelected({
    required this.questionIndex,
    required this.optionIndex,
  });

  final int questionIndex;
  final int optionIndex;

  @override
  List<Object?> get props => <Object?>[questionIndex, optionIndex];
}

class LeaderBoardDetailsRequested extends ContestEvent {
  const LeaderBoardDetailsRequested();

  @override
  List<Object?> get props => <Object?>[];
}

class ContestResultsRequested extends ContestEvent {
  const ContestResultsRequested({required this.contestId});

  final String contestId;

  @override
  List<Object?> get props => <Object?>[contestId];
}

class ContestLeaderboardPageRequested extends ContestEvent {
  const ContestLeaderboardPageRequested({required this.contestId});

  final String contestId;

  @override
  List<Object?> get props => <Object?>[contestId];
}


