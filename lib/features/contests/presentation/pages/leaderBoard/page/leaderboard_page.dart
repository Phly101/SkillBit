import 'package:flutter/material.dart';
import 'package:skill_bit/core/widgets/best_ranking_widget.dart';
import 'package:skill_bit/core/widgets/gradiant_container.dart';
import 'package:skill_bit/features/contests/presentation/pages/leaderBoard/widgets/leaderboard_body.dart';
import 'package:skill_bit/features/contests/presentation/pages/leaderBoard/widgets/leaderboard_header.dart';
import '../../../../../../core/entities/leaderboard_entity.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  //  list of 10 contestants
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
    LeaderboardEntity(
      userId: '4',
      name: 'Elena Fisher',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      score: 1800,
      rank: '4',
      badgeIcon: 'bronze_badge.png',
    ),
    LeaderboardEntity(
      userId: '5',
      name: 'Marcus Holloway',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      score: 1750,
      rank: '5',
      badgeIcon: 'bronze_badge.png',
    ),
    LeaderboardEntity(
      userId: '6',
      name: 'Lara Croft',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      score: 1600,
      rank: '6',
      badgeIcon: 'bronze_badge.png',
    ),
    LeaderboardEntity(
      userId: '7',
      name: 'Nathan Drake',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      score: 1550,
      rank: '7',
      badgeIcon: 'bronze_badge.png',
    ),
    LeaderboardEntity(
      userId: '8',
      name: 'Chloe Frazer',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      score: 1400,
      rank: '8',
      badgeIcon: 'bronze_badge.png',
    ),
    LeaderboardEntity(
      userId: '9',
      name: 'Victor Sullivan',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      score: 1350,
      rank: '9',
      badgeIcon: 'bronze_badge.png',
    ),
    LeaderboardEntity(
      userId: '10',
      name: 'Sam Drake',
      profileUrl: 'Basel_EL_Rafei.jpeg',
      score: 1200,
      rank: '10',
      badgeIcon: 'bronze_badge.png',
    ),
  ];

  @override
  Widget build(final BuildContext context) {
    final List<LeaderboardEntity> podiumData = contestantsList
        .where((final LeaderboardEntity c) => c.inPodium)
        .toList();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradiantContainer(
            width: double.infinity,
            height: MediaQuery.heightOf(context) * 0.70,
            doAllTakeBorder: false,
            bottomLeft: 100,
            bottomRight: 100,
            begin: .topCenter,
            end: .bottomCenter,
          ),
          Column(
            children: <Widget>[
              // title, arrow back and home buttons
              const SizedBox(height: 60),
              const LeaderboardHeader(),
              // podium of the top 3
              BestRankingWidget(topThree: podiumData),
              const Spacer(),
              // list of contestants in the contest
              LeaderboardBody(contestantsList: contestantsList),
            ],
          ),
        ],
      ),
    );
  }
}
