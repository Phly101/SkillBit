import 'package:flutter/material.dart';
import 'package:skill_bit/core/entities/question_entity.dart';
import 'package:skill_bit/core/utils/features/contest&quiz/navigation_button_factory.dart';
import 'package:skill_bit/core/widgets/quiz&contest_factory/contest_page/widgets/common/question_widget.dart';

import 'contest_header.dart';

//Todo: will be subject for optimization later....
class ContestBody extends StatelessWidget {
  const ContestBody({
    super.key,
    required this.backFunction,
    required this.forwardFunction,
    required this.submitFunction,
    required this.goHomeFunction,
    required this.onOptionSelected,
    required this.goHomeButtonTxt,
    required this.forwardButtonTxt,
    required this.backButtonTxt,
    required this.submitButtonTxt,
    required this.questions,
    required this.pageIndex,
    required this.isViewingAnswers,
    this.isFinalPage = false,
    required this.contestDuration,
    required this.numOfParticipants,
    required this.currentPageIndex,
    required this.totalPages,
    required this.isContest,
  });

  final void Function()? backFunction;
  final void Function()? forwardFunction;
  final void Function()? submitFunction;
  final void Function()? goHomeFunction;
  final void Function(QuestionEntity question, int optionIndex)
  onOptionSelected;
  final String forwardButtonTxt;
  final String backButtonTxt;
  final String submitButtonTxt;
  final String goHomeButtonTxt;
  final List<QuestionEntity> questions;
  final Duration contestDuration;
  final int numOfParticipants;
  final int currentPageIndex;
  final int totalPages;
  final int pageIndex;
  final bool isViewingAnswers;
  final bool isFinalPage;
  final bool isContest;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 60),
          ContestHeader(
            contestDuration: contestDuration,
            numOfParticipants: numOfParticipants,
            currentPageNum: currentPageIndex + 1,
            lastPageNum: totalPages,
            isContest: isContest,
          ),
          //questions part
          ...questions.asMap().entries
          // loop to make the question Widgets
          .map((final MapEntry<int, QuestionEntity> entry) {
            int localIndex = entry.key;
            QuestionEntity q = entry.value;
            // question number calculator
            int questionNumber = (pageIndex * 5) + localIndex + 1;
            return Padding(
              padding: const .only(bottom: 20.0),
              child: QuestionWidget(
                onOptionSelected: (final int selectedOption) {
                  onOptionSelected(q, selectedOption);
                },
                isViewingAnswers: isViewingAnswers,
                question: q,
                selectedIndex: q.selectedAnswerIndex ?? -1,
                questionNumber: questionNumber,
              ),
            );
          }),

          // buttons part
          Row(
            mainAxisAlignment: .spaceBetween,
            children: NavigationButtonFactory.buildNavigationButtons(
              context: context,
              backFunction: backFunction,
              forwardFunction: forwardFunction,
              submitFunction: submitFunction,
              goHomeFunction: goHomeFunction,
              forwardButtonTxt: forwardButtonTxt,
              backButtonTxt: backButtonTxt,
              submitButtonTxt: submitButtonTxt,
              goHomeButtonTxt: goHomeButtonTxt,
              isViewingAnswers: isViewingAnswers,
              isFinalPage: isFinalPage,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
