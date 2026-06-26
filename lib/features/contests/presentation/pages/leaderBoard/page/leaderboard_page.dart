import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/utils/global/box_state_switcher.dart';
import 'package:skill_bit/core/widgets/global/error/error_state_widget.dart';
import 'package:skill_bit/core/widgets/user/best_ranking_widget.dart';
import 'package:skill_bit/core/widgets/global/gradiant_container.dart';
import 'package:skill_bit/features/contests/domain/entities/leaderboard_entity.dart';
import 'package:skill_bit/features/contests/domain/entities/my_results_entity.dart';
import 'package:skill_bit/features/contests/presentation/Bloc/contest_bloc.dart';
import 'package:skill_bit/features/contests/presentation/pages/leaderBoard/widgets/components/leaderboard_body.dart';
import 'package:skill_bit/features/contests/presentation/pages/leaderBoard/widgets/components/leaderboard_header.dart';


class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key, this.contestId});

  final String? contestId;

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  void initState() {
    super.initState();

    context.read<ContestBloc>().add(
      ContestLeaderboardPageRequested(contestId: widget.contestId ?? ''),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: BoxStateSwitcher<ContestBloc, ContestState>(
        onInitial: (final BuildContext context, final ContestState state) =>
            const Center(child: CircularProgressIndicator()),
        loadingWidget: const Center(child: CircularProgressIndicator()),
        onError:
            (
              final String message,
              final BuildContext context,
              final ContestState state,
            ) => ErrorStateWidget(
              message: message,
              reFreshFunction: () => context.read<ContestBloc>().add(
                widget.contestId != null
                    ? ContestLeaderboardPageRequested(
                        contestId: widget.contestId!,
                      )
                    : const LeaderBoardDetailsRequested(),
              ),
            ),
        onSuccess: (final BuildContext context, final ContestState state) {
          List<dynamic> podium = <dynamic>[];
          List<LeaderboardEntity> others = <LeaderboardEntity>[];
          MyResultEntity? myResult;
          if (state is ContestLeaderboardPageSuccess) {
            podium = state.top3;
            myResult = state.myResult;

            final List<String> podiumNames = podium
                .map((final dynamic e) => e.fullname as String)
                .toList();

            others =
                state.leaderboard
                    .where(
                      (final LeaderboardEntity e) =>
                          !podiumNames.contains(e.fullname),
                    )
                    .toList()
                  ..sort(
                    (final LeaderboardEntity a, final LeaderboardEntity b) =>
                        a.rank.compareTo(b.rank),
                  );
          }

          return Stack(
            children: <Widget>[
              GradiantContainer(
                width: double.infinity,
                height: MediaQuery.heightOf(context) * 0.70,
                doAllTakeBorder: false,
                bottomLeft: 100,
                bottomRight: 100,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              Column(
                children: <Widget>[
                  const SizedBox(height: 60),
                  LeaderboardHeader(contestId: widget.contestId ?? ''),
                  if (podium.isNotEmpty) BestRankingWidget(topThree: podium),
                  const Spacer(),
                  if (others.isNotEmpty)
                    LeaderboardBody(
                      contestantsList: others,
                      myResult: myResult,
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
