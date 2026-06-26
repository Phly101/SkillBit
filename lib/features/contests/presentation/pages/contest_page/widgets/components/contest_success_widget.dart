import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/router/routes.dart';
import '../../../../../../../core/widgets/quiz&contest_factory/contest_page/page/quiz_and_contest_factory.dart';
import '../../../../Bloc/contest_bloc.dart';

class ContestSuccessWidget extends StatelessWidget {
  const ContestSuccessWidget({
    super.key,
    required this.contestState,
    required this.pageController,
    required this.onTick,
    required this.onSubmit,
  });

  final ContestStartSuccess contestState;
  final PageController pageController;
  final ValueChanged<Duration> onTick;
  final VoidCallback onSubmit;

  @override
  Widget build(final BuildContext context) {
    return QuizAndContestFactory(
      allQuestions: contestState.contest.questions,
      selectedAnswers: contestState.selectedAnswers,
      pageController: pageController,
      isContest: true,
      contestDuration: Duration(minutes: contestState.contest.timeLimit),
      numOfParticipants: 30,
      goHomeFunction: () => context.go(AppRoutes.home),
      onTick: onTick,
      submitFunction: onSubmit,
      onOptionSelected: (final int qIndex, final int oIndex) {
        context.read<ContestBloc>().add(
          ContestAnswerSelected(questionIndex: qIndex, optionIndex: oIndex),
        );
      },
    );
  }
}
