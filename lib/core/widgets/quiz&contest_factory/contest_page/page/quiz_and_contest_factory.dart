import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/contest_strings.dart';
import 'package:skill_bit/core/entities/question_entity.dart';
import '../../../../theme/theme.dart';
import '../widgets/components/contest_body.dart';

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
  });

  final PageController pageController;
  final List<QuestionEntity> allQuestions;
  final Duration contestDuration;
  final int numOfParticipants;
  final void Function() goHomeFunction;
  final void Function() submitFunction;
  final void Function(QuestionEntity question, int optionIndex)
  onOptionSelected;
  final bool isContest;

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
      body: PageView.builder(
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
          List<QuestionEntity> pageQuestions = widget.allQuestions.sublist(
            start,
            end,
          );
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
            onOptionSelected: widget.onOptionSelected,
            goHomeButtonTxt: ContestStrings.goHomeButtonTxt,
            forwardButtonTxt: ContestStrings.forwardButtonTxt,
            backButtonTxt: ContestStrings.backButtonTxt,
            submitButtonTxt: ContestStrings.submitButtonTxt,
            questions: pageQuestions,
            pageIndex: pageIndex,
            isViewingAnswers: false,
            contestDuration: widget.contestDuration,
            numOfParticipants: widget.numOfParticipants,
            currentPageIndex: currentPageIndex,
            totalPages: totalPages,
            isFinalPage: totalPages == currentPageIndex + 1,
            isContest: widget.isContest,
          ).pH(10);
        },
      ),
    );
  }
}
