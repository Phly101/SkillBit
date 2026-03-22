import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/acheivment_component/acheivment_body.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements', style: context.textTheme.displayLarge),
        centerTitle: true,

        leading: ArrowBackButton(
          function: () {
            context.pop();
          },
          size: 30,
        ),
      ),

      body: const AcheivmentBody().pV(40),
    );
  }
}
