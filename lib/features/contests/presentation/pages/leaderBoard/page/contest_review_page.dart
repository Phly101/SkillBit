import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/entities/quiz_question_entity.dart';
import 'package:skill_bit/core/utils/features/quiz/review_data_mapper.dart';
import 'package:skill_bit/core/utils/global/box_state_switcher.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';
import 'package:skill_bit/core/widgets/global/error/error_state_widget.dart';
import 'package:skill_bit/core/widgets/quiz&contest_factory/contest_page/page/quiz_and_contest_factory.dart';
import 'package:skill_bit/features/contests/presentation/Bloc/contest_bloc.dart';


class ContestReviewPage extends StatefulWidget {
  const ContestReviewPage({
    super.key,
    required this.contestId,
  });

  final String contestId;

  @override
  State<ContestReviewPage> createState() => _ContestReviewPageState();
}

class _ContestReviewPageState extends State<ContestReviewPage> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<ContestBloc>().add(ContestReviewRequested(contestId: widget.contestId));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return BoxStateSwitcher<ContestBloc, ContestState>(
      onSuccess: (final BuildContext context, final ContestState state) {
        if (state is ContestReviewSuccess) {
          final List<QuizQuestionEntity> reviewQuestions =
              ReviewDataMapper.toQuizQuestions(state.reviewResult.questions);
          final Map<int, int> selectedAnswers = ReviewDataMapper.toSelectedAnswers(
            state.reviewResult.questions,
          );

          return Stack(
            children: <Widget>[
              QuizAndContestFactory(
                allQuestions: reviewQuestions,
                selectedAnswers: selectedAnswers,
                pageController: _pageController,
                isContest: true,
                contestDuration: Duration.zero,
                numOfParticipants: 0,
                isViewingAnswers: true,
                goHomeFunction: () => Navigator.of(context).pop(),
                submitFunction: () => Navigator.of(context).pop(),
                onOptionSelected: (final int qIndex, final int oIndex) {},
              ),
              Positioned(
                top: 40,
                left: 10,
                child: ArrowBackButton(function: () => Navigator.of(context).pop()),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
      onError: (final String message, final BuildContext context, final ContestState state) =>
          ErrorStateWidget(
            message: message,
            reFreshFunction: () => context.read<ContestBloc>().add(
              ContestReviewRequested(contestId: widget.contestId),
            ),
            routeFunction: () => Navigator.of(context).pop(),
          ),
      onInitial: (final BuildContext context, final ContestState state) =>
          const SizedBox.shrink(),
    );
  }
}
