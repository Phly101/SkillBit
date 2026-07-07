import 'package:flutter/material.dart';
import 'package:skill_bit/core/entities/quiz_question_entity.dart';
import 'package:skill_bit/core/utils/features/contest&quiz/navigation_button_factory.dart';
import 'package:skill_bit/core/widgets/quiz&contest_factory/contest_page/widgets/common/question_widget.dart';



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
    this.selectedAnswers = const <int, int>{},
    required this.pageIndex,
    required this.isViewingAnswers,
    this.isFinalPage = false,
    required this.isContest,
  });

  final void Function()? backFunction;
  final void Function()? forwardFunction;
  final void Function()? submitFunction;
  final void Function()? goHomeFunction;
  final void Function(int questionIndex, int optionIndex) onOptionSelected;
  final String forwardButtonTxt;
  final String backButtonTxt;
  final String submitButtonTxt;
  final String goHomeButtonTxt;
  final List<QuizQuestionEntity> questions;
  final Map<int, int> selectedAnswers;
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

          //questions part
          ...questions.asMap().entries.map((
            final MapEntry<int, QuizQuestionEntity> entry,
          ) {
            final int localIndex = entry.key;
            final QuizQuestionEntity q = entry.value;
            final int absoluteIndex = (pageIndex * 5) + localIndex;
            final int questionNumber = absoluteIndex + 1;

            final int selectedIndex = selectedAnswers[absoluteIndex] ?? -1;

            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: QuestionWidget(
                onOptionSelected: (final int selectedOption) {
                  onOptionSelected(localIndex, selectedOption);
                },
                isViewingAnswers: isViewingAnswers,
                question: q,
                selectedIndex: selectedIndex,
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
