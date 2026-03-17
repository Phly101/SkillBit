import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/assets.dart';
import 'package:skill_bit/features/profile/domain/entities/padge_entity.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/badge_component/badge_body.dart';

class BadgesPage extends StatelessWidget {
  const BadgesPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<BadgeEntity> badges = <BadgeEntity>[
      BadgeEntity(imagePath: Assets.icon('bronze_badge.png'), isLocked: false),
      BadgeEntity(imagePath: Assets.icon('bronze_badge.png'), isLocked: true),
      BadgeEntity(imagePath: Assets.icon('bronze_badge.png'), isLocked: true),
      BadgeEntity(imagePath: Assets.icon('bronze_badge.png'), isLocked: true),
      BadgeEntity(imagePath: Assets.icon('bronze_badge.png'), isLocked: true),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Badges', style: context.textTheme.displayLarge),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 25),
          onPressed: () => context.pop(),
        ),
      ),
      body: BadgeBody(badges: badges),
    );
  }
}
