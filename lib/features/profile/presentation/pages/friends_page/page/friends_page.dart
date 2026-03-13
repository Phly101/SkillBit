import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/presentation/pages/friends_page/widget/components/friends_body.dart';
import '../../../../domain/entities/friends_entity.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<FriendsEntity> friendsList = <FriendsEntity>[
      FriendsEntity(
        name: 'Basel El Rafei',
        scorePoints: 250,
        progress: 0.85,
      ),
      FriendsEntity(
        name: 'Alex Thorne',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 210,
        progress: 0.70,
      ),
      FriendsEntity(
        name: 'Sam Chen',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 195,
        progress: 0.45,
      ),
      FriendsEntity(
        name: 'Zara Khan',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 180,
        progress: 0.90,
      ),
      FriendsEntity(
        name: 'Elena Rodriguez',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 175,
        progress: 0.30,
      ),
      FriendsEntity(
        name: 'Jordan Smith',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 160,
        progress: 0.55,
      ),
      FriendsEntity(
        name: 'Mona Hassan',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 150,
        progress: 0.15,
      ),
      FriendsEntity(
        name: "Liam O'Connor",
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 140,
        progress: 0.65,
      ),
      FriendsEntity(
        name: 'Sophia Wang',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 130,
        progress: 0.80,
      ),
      FriendsEntity(
        name: 'Omar Sharif',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 120,
        progress: 0.40,
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'My Learning Circle',
            style: context.textTheme.displayLarge,
          ),
          centerTitle: true,
          leading:  IconButton(
            onPressed: //Todo: Implement Function logic
                () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              fontWeight: .bold,
              size: 30,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
      body: FriendsBody(friendsList: friendsList).pH(10)
    );
  }
}
