import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nested/nested.dart';
import '../../../../../../../core/constants/contest_details_strings.dart';
import '../../../../../../../core/theme/theme.dart';
import '../../../../../../../core/widgets/global/button_widget.dart';
import '../../../../Bloc/contest_bloc.dart';
import '../../../../Bloc/join_contest_bloc.dart';

class RegisterJoinButton extends StatelessWidget {
  const RegisterJoinButton({super.key, required this.contestId});

  final String contestId;

  void _onJoin(final BuildContext context) {
    context.read<JoinContestBloc>().add(
      JoinContestRequested(contestId: contestId),
    );
  }

  void _onStart(final BuildContext context) {
    context.read<ContestBloc>().add(
      ContestStartRequested(contestId: contestId),
    );
  }

  void _handleJoinContestState(
    final BuildContext context,
    final JoinContestState state,
  ) {
    if (state is JoinContestError) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  void _handleContestState(
    final BuildContext context,
    final ContestState state,
  ) {
    if (state is ContestStartSuccess) {
      context.goNamed('contest_page', extra: contestId);
    } else if (state is ContestStartError) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message)));
    }
  }

  @override
  Widget build(final BuildContext context) {
    return MultiBlocListener(
      listeners: <SingleChildWidget>[
        BlocListener<JoinContestBloc, JoinContestState>(
          listener: _handleJoinContestState,
        ),
        BlocListener<ContestBloc, ContestState>(listener: _handleContestState),
      ],
      child: _RegisterJoinButtonContent(
        contestId: contestId,
        onJoin: () => _onJoin(context),
        onStart: () => _onStart(context),
      ),
    );
  }
}

class _RegisterJoinButtonContent extends StatelessWidget {
  const _RegisterJoinButtonContent({
    required this.contestId,
    required this.onJoin,
    required this.onStart,
  });

  final String contestId;
  final VoidCallback onJoin;
  final VoidCallback onStart;

  static bool _isJoinBuildTrigger(
    final JoinContestState previous,
    final JoinContestState current,
  ) =>
      current is JoinContestLoading ||
      current is JoinContestSuccess ||
      current is JoinContestError;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<JoinContestBloc, JoinContestState>(
      buildWhen: _isJoinBuildTrigger,
      builder: (final BuildContext context, final JoinContestState joinState) {
        return BlocBuilder<ContestBloc, ContestState>(
          builder:
              (final BuildContext context, final ContestState contestState) {
                final bool isLoading = _isLoading(joinState, contestState);
                final bool isJoined = _isJoined(context, joinState);

                return ButtonWidget(
                  color: context.colorScheme.primary,
                  padding: 13,
                  function: isLoading ? null : (isJoined ? onStart : onJoin),
                  child: _ButtonContent(
                    isLoading: isLoading,
                    isJoined: isJoined,
                  ),
                );
              },
        );
      },
    );
  }

  bool _isLoading(
    final JoinContestState joinState,
    final ContestState contestState,
  ) => joinState is JoinContestLoading || contestState is ContestStartLoading;

  bool _isJoined(
    final BuildContext context,
    final JoinContestState joinState,
  ) =>
      joinState is JoinContestSuccess ||
      context.read<JoinContestBloc>().hasJoinedContest;
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({required this.isLoading, required this.isJoined});

  final bool isLoading;
  final bool isJoined;

  @override
  Widget build(final BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 18,
        width: 18,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: context.colorScheme.surface,
        ),
      );
    }

    return Text(
      isJoined ? ContestStrings.joinContest : ContestStrings.register,
      style: context.textTheme.displayMedium?.copyWith(
        color: context.colorScheme.surface,
      ),
    );
  }
}
