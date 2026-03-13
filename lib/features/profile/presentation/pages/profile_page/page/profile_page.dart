import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/presentation/pages/profile_page/widgets/components/profile_body.dart';
import 'package:skill_bit/features/profile/presentation/pages/profile_page/widgets/components/profile_header.dart';
import '../../../../../../core/entities/leaderboard_entity.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<LeaderboardEntity> contestantsList = <LeaderboardEntity>[
    LeaderboardEntity(
      userId: '1',
      name: 'Ahmed Zaki',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      score: 2500,
      rank: '👑',
      badgeIcon: 'bronze_badge.png',
      inPodium: true,
    ),
    LeaderboardEntity(
      userId: '2',
      name: 'Sarah Connor',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      score: 2100,
      rank: '2',
      badgeIcon: 'bronze_badge.png',
      inPodium: true,
    ),
    LeaderboardEntity(
      userId: '3',
      name: 'John Doe',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      score: 1950,
      rank: '3',
      badgeIcon: 'bronze_badge.png',
      inPodium: true,
    ),
  ];

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: <Widget>[
          const ProfileHeader(
            profileUrl: 'Basel_EL_Rafei.jpeg',
            userName: 'Basel',
            userPoints: '200 points',
          ),
          ProfileBody(hasBestRank: true, topThree: contestantsList),
          30.heightBox,
        ],
      ),
    ).pH(20);
  }
}
