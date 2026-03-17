import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/contest_details_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/assets.dart';
import 'package:skill_bit/features/contests/presentation/pages/contest_details/widgets/common/round_and_difficulty.dart';
import 'package:skill_bit/features/contests/presentation/pages/contest_details/widgets/common/start_in.dart';

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
    return Container(
       //update here
      width: double.infinity,
     
      decoration: BoxDecoration(
        border: Border.all(
          //update here
          color: context.colorScheme.onSurface.withValues(alpha: .25),
          width: 1,
        ),
        color: context.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            //update here
            color: context.colorScheme.onPrimary.withValues(alpha: .25),
            blurRadius: 4,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          RoundAndDifficulty(
            round: ContestStrings.round1,
            difficulty: ContestStrings.medium, difficultyImagePath:Assets.image('fire_icon.png') ,  
            
            ),
          24.heightBox,
          Divider(thickness: 1, color: context.colorScheme.outline),
          5.heightBox,
          const StartIn(),
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
        //update here
      ).p10()
    );
  }
}
