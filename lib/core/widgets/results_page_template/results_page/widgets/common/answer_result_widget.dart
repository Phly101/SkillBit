import 'package:flutter/material.dart';
import 'package:skill_bit/core/widgets/results_page_template/results_page/widgets/common/answer_card.dart';
import '../../../../../theme/theme.dart';

class AnswerResultWidget extends StatelessWidget {
  const AnswerResultWidget({
    super.key,
    required this.totalQuestions,
    required this.wrongAnswers,
    required this.rightAnswers,
  });

  final int totalQuestions;
  final int wrongAnswers;
  final int rightAnswers;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        //total questions
        Row(
          children: <Widget>[
            Text(
              'Total Question',
              style: context.textTheme.displayLarge!.copyWith(
                fontSize: 24,
                fontWeight: .normal,
              ),
            ),
            const Spacer(),
            Text(
              totalQuestions.toString(),
              style: context.textTheme.displayLarge
            ),
          ],
        ),
        const SizedBox(height: 30),
        // answers cards
        Row(
          children: <Widget>[
            //wrong answer card
            Expanded(
              child: AnswerCard(
                cardText: 'Wrong Answer',
                color: context.colorScheme.error,
                answersNum: wrongAnswers,
              ),
            ),
            const SizedBox(width: 30),
            // right answer card
            Expanded(
              child: AnswerCard(
                cardText: 'Right Answers',
                color: context.colorScheme.onError,
                answersNum: rightAnswers,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
