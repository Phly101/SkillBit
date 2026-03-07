import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/contest_details_strings.dart';
import 'package:skill_bit/core/utils/assets.dart';
import 'package:skill_bit/features/contests/presentation/pages/contest_details/widgets/common/state_card.dart';

class EventStatsRow extends StatelessWidget {
  const EventStatsRow({super.key});

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        StatCard(
          imagePath: Assets.icon('Group.png'),
          topText: ContestStrings.participants,
          bottomText: ContestStrings.participantsLabel,
        ),

        // المربع الثاني
        StatCard(
          imagePath: Assets.icon('clock_image.png'),
          topText: ContestStrings.durationValue,
          bottomText: ContestStrings.duration,
          //borderColor هنا ستأخذ القيمة الافتراضية الرمادية
        ),

        // المربع الثالث
        StatCard(
          imagePath: Assets.image('Diamond-removebg-preview.png'),
          topText: ContestStrings.rewardValue,
          bottomText: ContestStrings.reward,
        ),
      ],
    );
  }
}
