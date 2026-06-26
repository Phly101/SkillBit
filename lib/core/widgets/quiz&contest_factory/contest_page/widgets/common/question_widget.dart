import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import '../../../../../entities/quiz_question_entity.dart';
import 'question_item.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.isViewingAnswers,
    required this.question,
    required this.questionNumber,
    required this.selectedIndex,
    required this.onOptionSelected,
  });

  final QuizQuestionEntity question;
  final int questionNumber;
  final int? selectedIndex;
  final bool isViewingAnswers;
  final Function(int) onOptionSelected;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$questionNumber.${question.question}',
          style: context.textTheme.displayLarge!.copyWith(fontSize: 20),
        ),
        10.heightBox,
        // loop over to create the question items
        ...question.options.asMap().entries.map((
          final MapEntry<int, String> entry,
        ) {
          final int index = entry.key;
          final String optionText = entry.value;

          final bool isThisChosen = selectedIndex == index;
          final bool isThisCorrect = (question.correctAnswerIndex ?? -1) == index;

          return InkWell(
            onTap: isViewingAnswers ? null : () => onOptionSelected(index),
            child: QuestionItem(
              answerTitle: optionText,
              isChosen: isThisChosen,
              isCorrect: isThisCorrect,
              isViewingAnswers: isViewingAnswers,
              optionIndex: index,
              hint: isThisCorrect ? question.correctAnswerHint : null,
            ),
          );
        }),
      ],
    );
  }
}
