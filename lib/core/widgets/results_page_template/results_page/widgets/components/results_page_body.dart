import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/results_page_template/results_page/widgets/common/answer_result_widget.dart';
import 'package:skill_bit/core/widgets/results_page_template/results_page/widgets/common/score_widget.dart';
import 'package:skill_bit/core/widgets/results_page_template/results_page/widgets/components/results_page_header.dart';

class ResultsPageBody extends StatelessWidget {
  const ResultsPageBody({
    super.key,
    required this.isContest,
    required this.pageTitle,
    required this.correctScorePercentage,
    required this.inCorrectScorePercentage,
    required this.totalQuestions,
    required this.wrongAnswers,
    required this.rightAnswers,
    required this.reviewFunction,
    required this.showLeaderBoardFunction,
  }) : assert(
         correctScorePercentage + inCorrectScorePercentage <= 100,
         'Total score percentage cannot exceed 100%',
       );

  final bool isContest;
  final String pageTitle;
  final double correctScorePercentage;
  final double inCorrectScorePercentage;
  final int totalQuestions;
  final int wrongAnswers;
  final int rightAnswers;
  final void Function() reviewFunction;
  final void Function() showLeaderBoardFunction;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: <Widget>[
        const SizedBox(height: 100),
        ResultsPageHeader(title: pageTitle),
        const SizedBox(height: 50),
        ScoreWidget(
          correctScorePercentage: correctScorePercentage,
          inCorrectScorePercentage: inCorrectScorePercentage,
        ),

        Expanded(
          child: AnswerResultWidget(
            totalQuestions: totalQuestions,
            wrongAnswers: wrongAnswers,
            rightAnswers: rightAnswers,
          ),
        ),

        Row(
          children: <Widget>[
            if (isContest) ...<Widget>[
              // show ranks button
              Expanded(
                child: ElevatedButton(
                  onPressed: showLeaderBoardFunction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorScheme.tertiary,
                  ),
                  child: Text(
                    'Show Leaderboard',
                    style: context.textTheme.displayMedium,
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],

            // review Answers button
            Expanded(
              child: ElevatedButton(
                onPressed: reviewFunction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isContest
                      ? context.colorScheme.secondary
                      : null,
                ),
                child: Text(
                  'Review Answers',
                  style: context.textTheme.displayMedium,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
