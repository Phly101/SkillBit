import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

import '../common/page_progress.dart';
import '../common/participants_tile.dart';
import '../common/timer_widget.dart';

class ContestHeader extends StatelessWidget {
  const ContestHeader({
    super.key,
    required this.contestDuration,
    this.numOfParticipants,
    required this.currentPageNum,
    required this.lastPageNum,
    required this.isContest,
  });

  final Duration contestDuration;
  final int? numOfParticipants;
  final int currentPageNum;
  final int lastPageNum;
  final bool isContest;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: <Widget>[
        TimerWidget(contestDuration: contestDuration),
        15.heightBox,
        isContest
            ? ParticipantsTile(numOfParticipants: numOfParticipants)
            : const SizedBox(),
        15.heightBox,
        PageProgress(currentPageNum: currentPageNum, lastPageNum: lastPageNum),
        30.heightBox,
      ],
    );
  }
}
