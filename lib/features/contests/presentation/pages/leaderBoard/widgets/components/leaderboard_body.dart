import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/contests/presentation/pages/leaderBoard/widgets/common/rank_tile_widget.dart';

import '../../../../../domain/entities/leaderboard_entity.dart';
import '../../../../../domain/entities/my_results_entity.dart';

class LeaderboardBody extends StatelessWidget {
  const LeaderboardBody({
    super.key,
    required this.contestantsList,
    this.myResult,
  });

  final List<LeaderboardEntity> contestantsList;
  final MyResultEntity? myResult;

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
          final bool isCurrentUser =
              myResult != null && contestant.fullname == myResult!.fullname;

          return RankTileWidget(
            rank: contestant.rank,
            profileUrl: contestant.profilePicture ?? '',
            badgeUrl: contestant.badge,
            name: contestant.fullname,
            score: contestant.score,
            isCurrentUser: isCurrentUser,
            addFunction: () {},
            viewProfileFunction: () {},
          ).p10();
        },
      ),
    );
  }
}
