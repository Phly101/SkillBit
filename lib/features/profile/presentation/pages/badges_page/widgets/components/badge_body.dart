import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/domain/entities/badge_entity.dart';
import 'package:skill_bit/features/profile/presentation/pages/badges_page/widgets/components/badge_card.dart';
import 'package:skill_bit/features/profile/presentation/pages/badges_page/widgets/components/badge_row_widget.dart';

class BadgeBody extends StatelessWidget {
  const BadgeBody({super.key, required this.badges});

  final List<BadgeEntity> badges;

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
            url: badges[4].url,
            isLocked: badges[4].isLocked,
          ),
        ],
      ),
    );
  }
}
