import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/constants/contest_details_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/custom_app_bar.dart';

// import '../common/event_stats_row.dart';
import '../../../../../../../core/di/injection_container.dart';
import '../../../../Bloc/join_contest_bloc.dart';
import '../common/contest_timer_card.dart';
import '../common/register_join_button.dart';

class ContestDetailsBody extends StatelessWidget {
  const ContestDetailsBody({
    super.key,
    required this.contestId,
    required this.contestDate,
    required this.difficulty,
  });

  final String contestId;
  final DateTime contestDate;
  final String difficulty;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          44.heightBox,
          const CustomAppBar(title: ContestStrings.contest),
          30.heightBox,
          //contest Card
          ContestTimerCard(contestDate: contestDate, difficulty: difficulty),
          15.heightBox,
          // Contest Event stats widgets
          //   const EventStatsRow(),
          10.heightBox,
          Divider(
            thickness: 1,
            color: context.colorScheme.outline,
            endIndent: 15,
            indent: 15,
          ),

          20.heightBox,
          20.heightBox,

          //about contest
          BlocProvider<JoinContestBloc>(
            create: (final BuildContext context) => sl<JoinContestBloc>(),
            child: RegisterJoinButton(contestId: contestId),
          ),
          20.heightBox,
          // BlocProvider<ContestBloc>.value(
          //   value: BlocProvider.of<ContestBloc>(context),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       context.pushNamed(
          //         'contest_leaderboards',
          //         pathParameters: <String, String>{'contestId': contestId},
          //         extra: context.read<ContestBloc>(),
          //       );
          //     },
          //     child: const Text('go to leaderboard'),
          //   ),
          // ),
          20.heightBox,
          //contest description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ContestStrings.aboutContest,
                style: context.textTheme.displayMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              ContestStrings.aboutContestBody,
              style: context.textTheme.displayMedium?.copyWith(
                color: context.colorScheme.onSurface,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
          20.heightBox,
        ],
      ),
    );
  }
}
