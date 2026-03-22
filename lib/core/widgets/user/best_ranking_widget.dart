import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/profile_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/user/podium_widget.dart';
import '../../../features/contests/presentation/pages/leaderBoard/widgets/common/winner_column.dart';
import '../../entities/leaderboard_entity.dart';

class BestRankingWidget extends StatelessWidget {
  const BestRankingWidget({
    super.key,
    this.isProfile = false,
    required this.topThree,
  });

  final bool isProfile;
  final List<LeaderboardEntity> topThree;

  @override
  Widget build(final BuildContext context) {
    //Todo: figure a way to remove the column when not in profile view

    return Column(
      children: <Widget>[
        if (isProfile) ...<Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              ProfileStrings.bestRanking,
              style: context.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // top 2
            WinnerColumn(
              name: topThree[1].name,
              score: topThree[1].score,
              isProfile: isProfile,
              child: PodiumWidget(
                standing: topThree[1].rank,
                profileUrl: topThree[1].profileUrl,
                paddingTop: 60,
                radius: 40,
                badgeUrl: topThree[1].badgeIcon,
                heroTag: 'hero-${topThree[1].name}',
              ),
            ),
            //top 1
            WinnerColumn(
              name: topThree[0].name,
              score: topThree[0].score,
              isProfile: isProfile,
              child: PodiumWidget(
                standing: '👑',
                profileUrl: topThree[0].profileUrl,
                radius: 50,
                paddingTop: 5,
                badgeUrl: topThree[0].badgeIcon,
                heroTag: 'hero-${topThree[0].name}',
              ),
            ),
            // top 3
            WinnerColumn(
              name: topThree[2].name,
              score: topThree[2].score,
              isProfile: isProfile,
              child: PodiumWidget(
                standing: topThree[2].rank,
                profileUrl: topThree[2].profileUrl,
                paddingTop: 70,
                radius: 40,
                badgeUrl: topThree[2].badgeIcon,
                heroTag: 'hero-${topThree[2].name}',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
