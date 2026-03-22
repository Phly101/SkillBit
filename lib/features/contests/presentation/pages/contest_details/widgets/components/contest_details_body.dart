import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/contest_details_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/button_widget.dart';
import 'package:skill_bit/core/widgets/global/custom_app_bar.dart';

import '../../../../../../../core/router/routes.dart';
import '../common/event_stats_row.dart';
import '../common/contest_timer_card.dart';

class ContestDetailsBody extends StatelessWidget {
  const ContestDetailsBody({super.key});

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          44.heightBox,
          const CustomAppBar(title: ContestStrings.contest),
          30.heightBox,
          //contest Card
          const ContestTimerCard(
            contestTime: ContestStrings.contestTime,
            contestDate: ContestStrings.contestDate,
          ),
          15.heightBox,
          // Contest Event stats widgets
          const EventStatsRow(),
          10.heightBox,
          Divider(
            thickness: 1,
            color: context.colorScheme.outline,
            endIndent: 15,
            indent: 15,
          ),
          10.heightBox,
          // join contest button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ButtonWidget(
              color: context.colorScheme.onSurfaceVariant,
              padding: 13,
              function: //Todo: Implement Function logic
              () {
                //temp use for now
                //Todo: change the logic to only go if contest date is met
                context.go(AppRoutes.contestPage);
              },
              child: Text(
                ContestStrings.contestLocked,
                style: context.textTheme.displayMedium?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          20.heightBox,
          // register contest button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ButtonWidget(
              color: context.colorScheme.primary,
              padding: 13,
              function: //Todo: Implement Function logic
                  () {},
              child: Text(
                ContestStrings.register,
                style: context.textTheme.displayMedium?.copyWith(
                  color: context.colorScheme.surface,
                ),
              ),
            ),
          ),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ContestStrings.aboutContest,
                style: context.textTheme.displayMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
          ),
          10.heightBox,
          //contest description
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
