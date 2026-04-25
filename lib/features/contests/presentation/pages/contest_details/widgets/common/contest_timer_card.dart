import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/contest_details_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/assets.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/features/contests/presentation/pages/contest_details/widgets/common/round_and_difficulty.dart';

class ContestTimerCard extends StatelessWidget {
  const ContestTimerCard({
    super.key,
    required this.contestTime,
    required this.contestDate,
  });

  final String contestTime;
  final String contestDate;

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      borderRadius: 10,
      child: Column(
        children: <Widget>[
          RoundAndDifficulty(
            round: ContestStrings.round1,
            difficulty: ContestStrings.medium,
            difficultyImagePath: Assets.image('fire_icon.png'),
          ),
          10.heightBox,
          Text(
            contestTime,
            style: (context.textTheme.displayLarge ?? const TextStyle())
                .copyWith(color: context.colorScheme.error, fontSize: 50),
          ),
          Divider(
            thickness: 1,
            color: context.colorScheme.outline,
            endIndent: 5,
            indent: 5,
          ),
          Text(
            contestDate,
            style: (context.textTheme.displayMedium ?? const TextStyle())
                .copyWith(color: context.colorScheme.onSurface, fontSize: 18),
          ),
        ],
      ).p10(),
    );
  }
}
