import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';
import 'package:skill_bit/features/profile/domain/entities/badge_entity.dart';
import 'package:skill_bit/features/profile/presentation/pages/badges_page/widgets/components/badge_body.dart';

class BadgesPage extends StatelessWidget {
  const BadgesPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<BadgeEntity> badges = <BadgeEntity>[
      const BadgeEntity(
        url: 'badge1.png',
        isLocked: false,
        id: '1',
        description: '',
      ),
      const BadgeEntity(
        url: 'badge2.png',
        isLocked: false,
        id: '2',
        description: '',
      ),
      const BadgeEntity(
        url: 'badge3.png',
        isLocked: false,
        id: '3',
        description: '',
      ),
      const BadgeEntity(
        url: 'badge4.png',
        isLocked: false,
        id: '4',
        description: '',
      ),
      const BadgeEntity(
        url: 'badge5.png',
        isLocked: true,
        id: '5',
        description: '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Badges', style: context.textTheme.displayLarge),
        centerTitle: true,
        leading: ArrowBackButton(function: () => context.pop()),
      ),
      body: BadgeBody(badges: badges),
    );
  }
}
