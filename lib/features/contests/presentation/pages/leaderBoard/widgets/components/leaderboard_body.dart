import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/contests/presentation/pages/leaderBoard/widgets/common/rank_tile_widget.dart';

import '../../../../../../../core/entities/leaderboard_entity.dart';

class LeaderboardBody extends StatelessWidget {
  const LeaderboardBody({super.key, required this.contestantsList});

  final List<LeaderboardEntity> contestantsList;

  @override
  Widget build(final BuildContext context) {
    //Todo: don't forget to add the highlight current user tile when making the logic
    return Container(
      width: MediaQuery.widthOf(context) * 0.9,
      height: MediaQuery.heightOf(context) * 0.40,
      decoration: BoxDecoration(
        borderRadius: .circular(20),
        color: context.colorScheme.surface,
      ),
      child: ListView.builder(
        itemCount: contestantsList.length,

        itemBuilder: (final BuildContext context, final int index) {
          final LeaderboardEntity contestant = contestantsList[index];
          return RankTileWidget(
            rank: contestant.rank,
            profileUrl: contestant.profileUrl,
            badgeUrl: contestant.badgeIcon,
            name: contestant.name,
            score: contestant.score,
            id: contestant.userId,
            addFunction: //Todo: Implement Function logic
                () {},
            viewProfileFunction: //Todo: Implement Function logic
                () {},
          ).p10();
        },
      ),
    );
  }
}
