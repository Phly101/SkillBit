import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/profile_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/contest&quiz/get_best_ranking_data.dart';
import 'package:skill_bit/core/widgets/user/podium_widget.dart';
import '../../../features/contests/presentation/pages/leaderBoard/widgets/common/winner_column.dart';

class BestRankingWidget extends StatelessWidget {
  const BestRankingWidget({
    super.key,
    this.isProfile = false,
    required this.topThree,
  });

  final bool isProfile;
  final List<dynamic> topThree;

  @override
  Widget build(final BuildContext context) {
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
            if (topThree.length > 1)
              WinnerColumn(
                name: GetBestRankingData.getName(topThree[1]),
                score: GetBestRankingData.getScore(topThree[1]),
                isProfile: isProfile,
                child: PodiumWidget(
                  standing: GetBestRankingData.getRank(topThree[1]),
                  profileUrl: GetBestRankingData.getProfile(topThree[1]),
                  paddingTop: 60,
                  radius: 40,
                  badgeUrl: GetBestRankingData.getBadge(topThree[1]),
                  heroTag:
                      'hero-${GetBestRankingData.getName(topThree[1])}-${GetBestRankingData.getRank(topThree[1])}',
                ),
              )
            else
              const SizedBox(width: 80),
            //top 1
            if (topThree.isNotEmpty)
              WinnerColumn(
                name: GetBestRankingData.getName(topThree[0]),
                score: GetBestRankingData.getScore(topThree[0]),
                isProfile: isProfile,
                child: PodiumWidget(
                  standing: GetBestRankingData.getRank(topThree[0]),
                  profileUrl: GetBestRankingData.getProfile(topThree[0]),
                  radius: 50,
                  paddingTop: 5,
                  badgeUrl: GetBestRankingData.getBadge(topThree[0]),
                  heroTag:
                      'hero-${GetBestRankingData.getName(topThree[0])}-${GetBestRankingData.getRank(topThree[0])}',
                ),
              ),
            // top 3
            if (topThree.length > 2)
              WinnerColumn(
                name: GetBestRankingData.getName(topThree[2]),
                score: GetBestRankingData.getScore(topThree[2]),
                isProfile: isProfile,
                child: PodiumWidget(
                  standing: GetBestRankingData.getRank(topThree[2]),
                  profileUrl: GetBestRankingData.getProfile(topThree[2]),
                  paddingTop: 70,
                  radius: 40,
                  badgeUrl: GetBestRankingData.getBadge(topThree[2]),
                  heroTag:
                      'hero-${GetBestRankingData.getName(topThree[2])}-${GetBestRankingData.getRank(topThree[2])}',
                ),
              )
            else
              const SizedBox(width: 80),
          ],
        ),
      ],
    );
  }
}
