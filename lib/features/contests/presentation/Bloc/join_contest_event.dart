part of 'join_contest_bloc.dart';

abstract class JoinContestEvent extends Equatable {
  const JoinContestEvent();

  @override
  List<Object> get props => <Object>[];
}

class JoinContestRequested extends JoinContestEvent {
  const JoinContestRequested({required this.contestId});

  final String contestId;

  @override
  List<Object> get props => <Object>[contestId];
}
