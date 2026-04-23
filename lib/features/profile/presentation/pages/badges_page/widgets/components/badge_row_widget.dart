import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/domain/entities/badge_entity.dart';
import 'package:skill_bit/features/profile/presentation/pages/badges_page/widgets/components/badge_card.dart';

class BadgeRowWidget extends StatelessWidget {
  const BadgeRowWidget({super.key, required this.badges});

  final List<BadgeEntity> badges;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BadgeCard(url: badges[0].url, isLocked: badges[0].isLocked),
        40.widthBox,
        BadgeCard(url: badges[1].url, isLocked: badges[1].isLocked),
      ],
    );
  }
}
