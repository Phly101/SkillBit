import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/assets.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/badge_component/badge_card.dart';

class BadgeRowWidget extends StatelessWidget {
  const BadgeRowWidget({super.key});

  @override
  Widget build( final BuildContext context) {
    return Row(
mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BadgeCard(imagePath: Assets.icon('badge1.png'), isLocked:false),
        40.widthBox,
        BadgeCard(imagePath: Assets.icon('bronze_badge.png'), isLocked:true),
      ],
    );
  }
}
