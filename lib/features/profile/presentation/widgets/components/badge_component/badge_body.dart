import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/assets.dart';
import 'package:skill_bit/features/profile/domain/entities/padge_entity.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/badge_component/badge_card.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/badge_component/badge_row_widget.dart';

class BadgeBody extends StatelessWidget {
  BadgeBody({super.key});

  final List<BadgeEntity> badges = <BadgeEntity>[
    BadgeEntity(imagePath: Assets.icon('bronze_badge.png'), isLocked: false),
    BadgeEntity(imagePath: Assets.icon('bronze_badge.png'), isLocked: true),
    BadgeEntity(imagePath: Assets.icon('bronze_badge.png'), isLocked: true),
    BadgeEntity(imagePath: Assets.icon('bronze_badge.png'), isLocked: true),
    BadgeEntity(imagePath: Assets.icon('bronze_badge.png'), isLocked: true),
  ];

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          40.heightBox,
          BadgeRowWidget(badges: <BadgeEntity>[badges[0], badges[1]]),
          50.heightBox,
          BadgeRowWidget(badges: <BadgeEntity>[badges[2], badges[3]]),
          50.heightBox,
          BadgeCard(
            imagePath: badges[4].imagePath,
            isLocked: badges[4].isLocked,
          ),
        ],
      ),
    );
  }
}
