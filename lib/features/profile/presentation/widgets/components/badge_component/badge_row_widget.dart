import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/domain/entities/padge_entity.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/badge_component/badge_card.dart';

class BadgeRowWidget extends StatelessWidget {
  const BadgeRowWidget({super.key, required this.badges});

  final List<BadgeEntity> badges;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BadgeCard(imagePath: badges[0].imagePath, isLocked: badges[0].isLocked),
        40.widthBox,
        BadgeCard(imagePath: badges[1].imagePath, isLocked: badges[1].isLocked),
      ],
    );
  }
}
