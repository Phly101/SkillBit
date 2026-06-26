import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/core/entities/send_answers_entity.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/features/contests/presentation/pages/contest_page/widgets/components/contest_body_widget.dart';
import '../../../../../core/widgets/global/error/error_state_widget.dart';
import '../../Bloc/contest_bloc.dart';

class ContestPage extends StatefulWidget {
  const ContestPage({super.key, required this.contestId});

  final String contestId;

  @override
  State<ContestPage> createState() => _ContestPageState();
}

class _ContestPageState extends State<ContestPage> {
  final PageController _pageController = PageController();
  Duration _elapsedTime = Duration.zero;

  @override
  void initState() {
    super.initState();
  }

  void _submitContest(
    final BuildContext context,
    final ContestStartSuccess state,
  ) {
    final List<String> formattedAnswers = <String>[];
    for (int i = 0; i < state.contest.questions.length; i++) {
      final int? selection = state.selectedAnswers[i];
      if (selection == null) {
        formattedAnswers.add('');
      } else {
        formattedAnswers.add(String.fromCharCode(65 + selection));
      }
    }

    context.read<ContestBloc>().add(
      ContestSubmitRequested(
        answers: SendAnswers(
          quizId: widget.contestId,
          answers: formattedAnswers,
          timeTaken: _elapsedTime,
        ),
      ),
    );
  }

  void _blocListener(final BuildContext context, final ContestState state) {
    if (state is ContestSubmitSuccess) {
      context.goNamed(
        AppRoutes.resultsPage,
        queryParameters: <String, String>{'contestId': widget.contestId},
        extra: state.results,
      );
      return;
    }

    if (state is ContestSubmitError) {
      _showSubmitErrorDialog(context, state);
    }
  }

  void _showSubmitErrorDialog(
    final BuildContext context,
    final ContestSubmitError errorState,
  ) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        content: ErrorStateWidget(
          message: errorState.message,
          routeFunction: null,
          reFreshFunction: () {
            Navigator.of(context).pop();

            final ContestState currentState = context.read<ContestBloc>().state;

            if (currentState is ContestStartSuccess) {
              _submitContest(context, currentState);
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<ContestBloc>(
      create: (_) =>
          sl<ContestBloc>()
            ..add(ContestStartRequested(contestId: widget.contestId)),
      child: BlocListener<ContestBloc, ContestState>(
        listener: _blocListener,
        child: ContestBodyWidget(
          contestId: widget.contestId,
          pageController: _pageController,
          onTick: (final Duration elapsed) => _elapsedTime = elapsed,
          onSubmit: _submitContest,
        ),
      ),
    );
  }
}
