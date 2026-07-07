part of 'join_contest_bloc.dart';

abstract class JoinContestState extends Equatable {
  const JoinContestState();

  @override
  List<Object> get props => <Object>[];
}

class JoinContestInitial extends JoinContestState {}
class JoinContestLoading extends JoinContestState {}
class JoinContestSuccess extends JoinContestState {}
class JoinContestError extends JoinContestState {
  const JoinContestError({required this.message});
  final String message;

  @override
  List<Object> get props => <Object>[message];
}