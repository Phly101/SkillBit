import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/profile_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/contest&quiz/get_best_ranking_data.dart';
import 'package:skill_bit/core/widgets/user/podium_widget.dart';
import 'package:skill_bit/features/contests/domain/entities/podium_entity.dart';
import '../../../features/contests/presentation/pages/leaderBoard/widgets/common/winner_column.dart';

class BestRankingWidget extends StatelessWidget {
  const BestRankingWidget({
    super.key,
    this.isProfile = false,
    required this.topThree,
  });

  final bool isProfile;
  final List<TopThreeEntity> topThree;

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
                name: topThree[1].fullname,
                score: topThree[1].score,
                isProfile: isProfile,
                child: PodiumWidget(
                  standing: topThree[1].rank,
                  profileUrl: topThree[1].profilePicture,
                  paddingTop: 60,
                  radius: 40,
                  badgeUrl: topThree[1].badge,
                  heroTag:
                      'hero-${GetBestRankingData.getName(topThree[1])}-${GetBestRankingData.getRank(topThree[1])}',
                ),
              )
            else
              const SizedBox(width: 80),
            //top 1
            if (topThree.isNotEmpty)
              WinnerColumn(
                name: topThree[0].fullname,
                score: topThree[0].score,
                isProfile: isProfile,
                child: PodiumWidget(
                  standing: topThree[0].rank,
                  profileUrl: topThree[0].profilePicture,
                  radius: 50,
                  paddingTop: 5,
                  badgeUrl: topThree[0].badge,
                  heroTag:
                      'hero-${GetBestRankingData.getName(topThree[0])}-${GetBestRankingData.getRank(topThree[0])}',
                ),
              ),
            // top 3
            if (topThree.length > 2)
              WinnerColumn(
                name: topThree[2].fullname,
                score: topThree[2].score,
                isProfile: isProfile,
                child: PodiumWidget(
                  standing: topThree[2].rank,
                  profileUrl: topThree[2].profilePicture,
                  paddingTop: 70,
                  radius: 40,
                  badgeUrl: topThree[2].badge,
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
