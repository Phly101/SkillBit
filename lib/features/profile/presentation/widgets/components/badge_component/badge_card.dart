import 'package:flutter/material.dart';
import 'package:skill_bit/features/profile/presentation/widgets/common/badge_common/locked_card.dart';
import 'package:skill_bit/features/profile/presentation/widgets/common/badge_common/unlocked_card.dart';

class BadgeCard extends StatelessWidget {

  const BadgeCard({super.key, required this.imagePath, required this.isLocked});
  final String imagePath;
  final bool isLocked;

  @override
  Widget build(final BuildContext context) {
    return isLocked
        ? LockedCard(imagePath: imagePath)
        : UnlockedCard(imagePath: imagePath);
  }
}
