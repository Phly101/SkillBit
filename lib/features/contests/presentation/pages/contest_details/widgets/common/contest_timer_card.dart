import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/contest_details_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/assets.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/features/contests/presentation/pages/contest_details/widgets/common/round_and_difficulty.dart';

import '../../../../../../../core/utils/features/contest&quiz/count_down_timer.dart';

import 'package:intl/intl.dart';

class ContestTimerCard extends StatelessWidget {
  const ContestTimerCard({
    super.key,
    required this.contestDate, required this.difficulty,
  });

  final DateTime contestDate;
  final String difficulty;

  String get _formattedDate =>
      DateFormat('MMM d, yyyy • h:mm a').format(contestDate.toLocal());

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      borderRadius: 10,
      child: Column(
        children: <Widget>[
          RoundAndDifficulty(
            round: ContestStrings.contest,
            difficulty: difficulty,
            difficultyImagePath: Assets.image('fire_icon.png'),
          ),
          10.heightBox,
          CountdownTimerText(
            targetDate: contestDate,
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
            _formattedDate,
            style: (context.textTheme.displayMedium ?? const TextStyle())
                .copyWith(color: context.colorScheme.onSurface, fontSize: 18),
          ),
        ],
      ).p10(),
    );
  }
}