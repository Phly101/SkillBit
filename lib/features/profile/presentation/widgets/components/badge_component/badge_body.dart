import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/assets.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/badge_component/badge_card.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/badge_component/badge_row_widget.dart';

class BadgeBody extends StatelessWidget {
  const BadgeBody({super.key});

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          40.heightBox,
          const BadgeRowWidget(),
          50.heightBox,
          const BadgeRowWidget(),
          50.heightBox,
          Center(
            child: BadgeCard(
              imagePath: Assets.icon('bronze_badge.png'),
              isLocked: true),
          )
        ],
      ),
    );
  }
}
