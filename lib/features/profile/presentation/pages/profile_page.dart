import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/profile_body.dart';
import 'package:skill_bit/features/profile/presentation/widgets/components/profile_header.dart';

import '../../../../core/utils/assets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: <Widget>[
          ProfileHeader(
            profileUrl: Assets.image('Basel_EL_Rafei.jpeg'),
            userName: 'Basel',
            userPoints: '200 points',

          ),
          const ProfileBody(hasBestRank: true,),
          30.heightBox,
        ],
      ),
    ).pH(20);
  }
}
