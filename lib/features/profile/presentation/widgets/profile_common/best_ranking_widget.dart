import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/profile_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/presentation/widgets/profile_common/podium_widget.dart';

import '../../../../../core/utils/assets.dart';

class BestRankingWidget extends StatelessWidget {
  const BestRankingWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            ProfileStrings.bestRanking,
            style: context.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // top 2
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: PodiumWidget(
                label: '2',
                profileUrl: Assets.image('Basel_EL_Rafei.jpeg'),
                paddingTop: 60,
                radius: 40,
                badgeUrl:Assets.icon('bronze_badge.png') ,
              ),
            ),
            //top 1
            PodiumWidget(
              label: '👑',
              profileUrl: Assets.image('Basel_EL_Rafei.jpeg'),
              radius: 50,
              paddingTop: 5,
              badgeUrl:Assets.icon('bronze_badge.png') ,
            ),
            // top 3
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: PodiumWidget(
                label: '3',
                profileUrl: Assets.image('Basel_EL_Rafei.jpeg'),
                paddingTop: 70,
                radius: 40,
                badgeUrl:Assets.icon('bronze_badge.png') ,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
