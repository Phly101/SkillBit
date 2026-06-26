import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';
import 'package:skill_bit/features/profile/domain/entities/achievement_entity.dart';
import 'package:skill_bit/features/profile/domain/enums/trophy_status.dart';
import 'package:skill_bit/features/profile/presentation/pages/achievement_page/widgets/components/achievement_body.dart';


class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<AchievementEntity> mockAchievements = <AchievementEntity>[
      const AchievementEntity(
        id: '1',
        title: 'First Blood',
        url: 'gold_trophy.png',
        description: 'Completed your first ever SkillBit contest.',
        isLocked: false,
        status: TrophyStatus.silver,
      ),
      const AchievementEntity(
        id: '2',
        title: 'Clean Coder',
        url: 'gold_trophy.png',
        description: 'Submitted a solution with 0 linting errors.',
        isLocked: false,
        status: TrophyStatus.gold,
      ),
      const AchievementEntity(
        id: '3',
        title: 'Speed Demon',
        url: 'gold_trophy.png',
        description: 'Solved a medium challenge in under 10 minutes.',
        isLocked: true,
        status: TrophyStatus.silver,
      ),
      const AchievementEntity(
        id: '4',
        title: 'Top 10%',
        url: 'gold_trophy.png',
        description: 'Ranked in the top 10% of a global contest.',
        isLocked: false,
        status: TrophyStatus.silver,
      ),
      const AchievementEntity(
        id: '5',
        title: 'Bug Hunter',
        url: 'gold_trophy.png',
        description: 'Found a logic edge case in a test suite.',
        isLocked: false,
        status: TrophyStatus.silver,
      ),
      const AchievementEntity(
        id: '6',
        title: 'Architecture Master',
        url: 'gold_trophy.png',
        description: 'Implemented 5 features using strict Clean Architecture.',
        isLocked: true,
        status: TrophyStatus.silver,
      ),
      const AchievementEntity(
        id: '7',
        title: 'Social Butterfly',
        url: 'gold_trophy.png',
        description: 'Shared your first achievement on LinkedIn.',
        isLocked: false,
        status: TrophyStatus.gold,
      ),
      const AchievementEntity(
        id: '8',
        title: 'Hardcore Solver',
        url: 'gold_trophy.png',
        description: 'Completed a Hard difficulty challenge.',
        isLocked: true,
        status: TrophyStatus.silver,
      ),
      const AchievementEntity(
        id: '9',
        title: 'Daily Streak',
        url: 'gold_trophy.png',
        description: 'Solved a challenge 7 days in a row.',
        isLocked: false,
        status: TrophyStatus.silver,
      ),
      const AchievementEntity(
        id: '10',
        title: 'Beta Tester',
        url: 'gold_trophy.png',
        description: 'Participated in the SkillBit early access program.',
        isLocked: false,
        status: TrophyStatus.silver,
      ),
      const AchievementEntity(
        id: '11',
        title: 'Daily Streak',
        url: 'gold_trophy.png',
        description: 'Solved a challenge 7 days in a row.',
        isLocked: false,
        status: TrophyStatus.silver,
      ),
      const AchievementEntity(
        id: '12',
        title: 'Beta Tester',
        url: 'gold_trophy.png',
        description: 'Participated in the SkillBit early access program.',
        isLocked: false,
        status: TrophyStatus.gold,
      ),
      const AchievementEntity(
        id: '13',
        title: 'Daily Streak',
        url: 'gold_trophy.png',
        description: 'Solved a challenge 7 days in a row.',
        isLocked: false,
        status: TrophyStatus.silver,
      ),
      const AchievementEntity(
        id: '14',
        title: 'Beta Tester',
        url: 'gold_trophy.png',
        description: 'Participated in the SkillBit early access program.',
        isLocked: false,
        status: TrophyStatus.silver,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements', style: context.textTheme.displayLarge),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: ArrowBackButton(
          function: () {
            context.pop();
          },
          size: 30,
        ),
      ),

      body:  AchievementBody(achievements: mockAchievements).pV(40),
    );
  }
}
