import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/box_state_switcher.dart';
import 'package:skill_bit/core/widgets/profile/profile_skeleton.dart';
import 'package:skill_bit/features/contests/domain/entities/leaderboard_entity.dart';
import 'package:skill_bit/features/profile/presentation/Bloc/profile_bloc.dart';
import 'package:skill_bit/features/profile/presentation/pages/profile_page/widgets/components/profile_body.dart';
import 'package:skill_bit/features/profile/presentation/pages/profile_page/widgets/components/profile_header.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(final BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (final BuildContext context) =>
          sl<ProfileBloc>()..add(const ProfileDetailsRequested()),
      child: BoxStateSwitcher<ProfileBloc, ProfileState>(
        onInitial: (final BuildContext context, final ProfileState state) =>
            const Center(child: CircularProgressIndicator()),
        loadingWidget: const ProfileSkeleton() ,
        onSuccess: (final BuildContext context, final ProfileState state) {
          if (state is ProfileSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ProfileHeader(
                    profileUrl: state.userProfile.profilePicture ?? '',
                    userName: state.userProfile.fullName,
                    userPoints: '${state.userProfile.score} points',
                    badgeUrl: state.userProfile.rank,
                  ),
                  const ProfileBody(
                    hasBestRank: false,
                    topThree: <LeaderboardEntity>[],
                  ),
                  30.heightBox,
                ],
              ),
            ).pH(20);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
