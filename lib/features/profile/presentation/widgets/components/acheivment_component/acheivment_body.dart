import 'package:flutter/material.dart';
import 'package:skill_bit/core/utils/global/assets.dart';
import 'package:skill_bit/features/profile/presentation/widgets/common/acheivment_common/achievment_widget.dart';

class AcheivmentBody extends StatelessWidget {
  const AcheivmentBody({super.key});

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AchievmentWidget(
          trophyImage: Assets.icon('trophy2.png'), 
          title: 'Quiz Master',
        ),
AchievmentWidget(
          trophyImage: Assets.icon('locked.png'), 
          title: 'Quiz Master',
        ),


      ],
    );
  }
}
