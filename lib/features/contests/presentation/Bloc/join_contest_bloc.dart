import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:skill_bit/core/error/failure.dart';
import 'package:skill_bit/features/contests/domain/useCases/contest_join.dart';
import 'package:skill_bit/features/contests/domain/useCases/params/contest_params.dart';

part 'join_contest_event.dart';

part 'join_contest_state.dart';

class JoinContestBloc extends Bloc<JoinContestEvent, JoinContestState> {
  JoinContestBloc({required this.joinContestUseCase})
    : super(JoinContestInitial()) {
    on<JoinContestRequested>(_onJoinContestRequested);
  }

  final JoinContest joinContestUseCase;
  bool hasJoinedContest = false;

  Future<void> _onJoinContestRequested(
    final JoinContestRequested event,
    final Emitter<JoinContestState> emit,
  ) async {
    emit(JoinContestLoading());

    final Either<Failure, void> result = await joinContestUseCase(
      ContestParams(id: event.contestId),
    );

    result.fold(
          (final Failure f) => emit(const JoinContestError(message: 'Join Contest Error')),
          (final void _) {
        hasJoinedContest = true;
        emit(JoinContestSuccess());
      },
    );
  }
}
