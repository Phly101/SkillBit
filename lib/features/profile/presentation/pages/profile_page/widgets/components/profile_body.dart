import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import '../../../../../../../core/entities/leaderboard_entity.dart';
import '../../../../../../../core/widgets/best_ranking_widget.dart';
import '../common/growth_graph_widget.dart';
import '../common/progress_pie_chart_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    this.hasBestRank = false,
    required this.topThree,
  });

  final bool hasBestRank;
  final List<LeaderboardEntity> topThree;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: <Widget>[
        if (hasBestRank) ...<Widget>[
          BestRankingWidget(topThree: topThree, isProfile: true),
        ],
        80.heightBox,
        const GrowthGraphWidget(),
        20.heightBox,
        //Todo: change the default values with ones from entities
        Column(
          children: <Widget>[
            Align(
              alignment: .centerLeft,
              child: Text(
                'All courses progress',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: .w800,
                ),
              ),
            ),
            const ProgressPieChartWidget(
              progressMade: 80,
              progressLeft: 20,
              title: 'Progress',
            ),
          ],
        ),
      ],
    );
  }
}
