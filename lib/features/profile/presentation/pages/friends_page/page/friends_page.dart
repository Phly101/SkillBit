import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/presentation/pages/friends_page/widget/components/friends_body.dart';
import 'package:skill_bit/features/search/domain/entities/search_friends_entity.dart';
import 'package:skill_bit/features/search/presentation/bloc/search_friends_bloc/search_friends_bloc.dart';
import '../../../../../../core/di/injection_container.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final List<SearchFriendsEntity> friendsList = <SearchFriendsEntity>[
      SearchFriendsEntity(
        name: 'Basel El Rafei',
        profileUrl: '',
        scorePoints: 250,
        progress: 0.85,
      ),
      SearchFriendsEntity(
        name: 'Alex Thorne',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 210,
        progress: 0.70,
      ),
      SearchFriendsEntity(
        name: 'Sam Chen',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 195,
        progress: 0.45,
      ),

      SearchFriendsEntity(
        name: 'Zara Khan',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 180,
        progress: 0.90,
      ),

      SearchFriendsEntity(
        name: 'Elena Rodriguez',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 175,
        progress: 0.30,
      ),

      SearchFriendsEntity(
        name: 'Jordan Smith',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 160,
        progress: 0.55,
      ),

      SearchFriendsEntity(
        name: 'Mona Hassan',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 150,
        progress: 0.15,
      ),
      SearchFriendsEntity(
        name: "Liam O'Connor",
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 140,
        progress: 0.65,
      ),
      SearchFriendsEntity(
        name: 'Sophia Wang',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 130,
        progress: 0.80,
      ),

      SearchFriendsEntity(
        name: 'Omar Sharif',
        profileUrl: 'Basel_EL_Rafei.jpeg',
        scorePoints: 120,
        progress: 0.40,
      ),
    ];

    return BlocProvider<SearchFriendsBloc>(
      create: (final BuildContext context) => sl<SearchFriendsBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'My Learning Circle',
            style: context.textTheme.displayLarge,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
        body: BlocBuilder<SearchFriendsBloc, SearchFriendsState>(
          builder: (final BuildContext context, final SearchFriendsState state) {
            List<SearchFriendsEntity> displayList = <SearchFriendsEntity>[];
            bool isLoading = false;
            String? errorMessage;

            if (state is SearchFriendsLoading) {
              isLoading = true;
              displayList =
                  <SearchFriendsEntity>[];
            } else if (state is SearchFriendsSuccess) {
              displayList = state.friends ?? <SearchFriendsEntity>[];
            } else if (state is SearchFriendsError) {
              errorMessage = state.message;
              displayList = <SearchFriendsEntity>[];
            } else {
              // Initial State
              displayList = friendsList;
            }
            return Column(
              children: <Widget>[
                Expanded(
                  child: FriendsBody(
                    friendsList: displayList,
                    isLoading: isLoading,
                    errorMessage: errorMessage,
                  ).pH(10),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
