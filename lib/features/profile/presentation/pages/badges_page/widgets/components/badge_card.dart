import 'package:flutter/material.dart';
import 'package:skill_bit/features/profile/presentation/pages/badges_page/widgets/components/locked_card.dart';
import 'package:skill_bit/features/profile/presentation/pages/badges_page/widgets/common/unlocked_card.dart';

class BadgeCard extends StatelessWidget {

  const BadgeCard({super.key, required this.url, required this.isLocked});
  final String url;
  final bool isLocked;

  @override
  Widget build(final BuildContext context) {
    return isLocked
        ? const LockedCard()
        : UnlockedCard(url: url);
  }
}
