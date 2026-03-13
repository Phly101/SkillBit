import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/results_page_template/results_page/widgets/components/results_page_body.dart';

class ContestResultPage extends StatelessWidget {
  const ContestResultPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      //Todo: switch hard coded values with dynamic ones
      body: ResultsPageBody(
        isContest: true,
        pageTitle: 'Contest Results',
        correctScorePercentage: 80,
        inCorrectScorePercentage: 20,
        totalQuestions: 30,
        wrongAnswers: 6,
        rightAnswers: 24,
        reviewFunction: //Todo: Implement Function logic
            () {},
        showLeaderBoardFunction: //Todo: Implement Function logic
        () {
          //temp navigation only logic
          context.go(AppRoutes.contestLeaderboards);
        },
      ).pH(10),
    );
  }
}
