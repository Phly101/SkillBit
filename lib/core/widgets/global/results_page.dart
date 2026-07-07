import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/results_page_template/results_page/widgets/components/results_page_body.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
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
  });

  final bool isContest;
  final String pageTitle;
  final num correctScorePercentage;
  final num inCorrectScorePercentage;
  final num totalQuestions;
  final num wrongAnswers;
  final num rightAnswers;
  final void Function() reviewFunction;
  final void Function() showLeaderBoardFunction;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: ResultsPageBody(
        isContest: isContest,
        pageTitle: pageTitle,
        correctScorePercentage: correctScorePercentage,
        inCorrectScorePercentage: inCorrectScorePercentage,
        totalQuestions: totalQuestions,
        wrongAnswers: wrongAnswers,
        rightAnswers: rightAnswers,
        reviewFunction: reviewFunction,
        showLeaderBoardFunction: showLeaderBoardFunction,
      ).pH(10),
    );
  }
}
