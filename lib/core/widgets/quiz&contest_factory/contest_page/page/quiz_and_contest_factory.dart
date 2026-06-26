import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/contest_strings.dart';
import 'package:skill_bit/core/entities/quiz_question_entity.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/quiz&contest_factory/contest_page/widgets/common/page_progress.dart';
import 'package:skill_bit/core/widgets/quiz&contest_factory/contest_page/widgets/common/participants_tile.dart';
import 'package:skill_bit/core/widgets/quiz&contest_factory/contest_page/widgets/common/timer_widget.dart';
import 'package:skill_bit/core/widgets/quiz&contest_factory/contest_page/widgets/components/contest_body.dart';


//Todo: will be subject for optimization later....
class QuizAndContestFactory extends StatefulWidget {
  const QuizAndContestFactory({
    super.key,
    required this.allQuestions,
    required this.goHomeFunction,
    required this.submitFunction,
    required this.onOptionSelected,
    required this.isContest,
    required this.pageController,
    required this.contestDuration,
    required this.numOfParticipants,
    this.selectedAnswers = const <int, int>{},
    this.onTick,
    this.isViewingAnswers = false,
  });

  final PageController pageController;
  final List<QuizQuestionEntity> allQuestions;
  final Duration contestDuration;
  final int numOfParticipants;
  final Map<int, int> selectedAnswers;
  final void Function() goHomeFunction;
  final void Function() submitFunction;
  final void Function(int questionIndex, int optionIndex) onOptionSelected;
  final bool isContest;
  final bool isViewingAnswers;
  final ValueChanged<Duration>? onTick;

  @override
  State<QuizAndContestFactory> createState() => _QuizAndContestFactoryState();
}

class _QuizAndContestFactoryState extends State<QuizAndContestFactory> {
  int get totalPages => (widget.allQuestions.length / 5).ceil();
  int currentPageIndex = 0;

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 60),
          if (!widget.isViewingAnswers)
            TimerWidget(
              contestDuration: widget.contestDuration,
              onTick: widget.onTick,
              onTimeUp: widget.submitFunction,
            ),
          15.heightBox,
          if (widget.isContest && !widget.isViewingAnswers)
            ParticipantsTile(numOfParticipants: widget.numOfParticipants),
          15.heightBox,
          PageProgress(
            currentPageNum: currentPageIndex + 1,
            lastPageNum: totalPages,
          ),
          30.heightBox,
          Expanded(
            child: PageView.builder(
              controller: widget.pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: totalPages,
              onPageChanged: (final int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              itemBuilder: (final BuildContext context, final int pageIndex) {
                final int start = pageIndex * 5;
                final int end = (start + 5) > widget.allQuestions.length
                    ? widget.allQuestions.length
                    : start + 5;
                final List<QuizQuestionEntity> pageQuestions = widget
                    .allQuestions
                    .sublist(start, end);

                return ContestBody(
                  backFunction: () => widget.pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  ),
                  forwardFunction: () => widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  ),
                  submitFunction: widget.submitFunction,
                  goHomeFunction: widget.goHomeFunction,
                  onOptionSelected:
                      (final int relativeIndex, final int optionIndex) {
                        final int absoluteIndex =
                            (pageIndex * 5) + relativeIndex;
                        widget.onOptionSelected(absoluteIndex, optionIndex);
                      },
                  goHomeButtonTxt: ContestStrings.goHomeButtonTxt,
                  forwardButtonTxt: ContestStrings.forwardButtonTxt,
                  backButtonTxt: ContestStrings.backButtonTxt,
                  submitButtonTxt: ContestStrings.submitButtonTxt,
                  questions: pageQuestions,
                  selectedAnswers: widget.selectedAnswers,
                  pageIndex: pageIndex,
                  isViewingAnswers: widget.isViewingAnswers,
                  isFinalPage: totalPages == currentPageIndex + 1,
                  isContest: widget.isContest,
                ).pH(10);
              },
            ),
          ),
        ],
      ),
    );
  }
}
