import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/profile/presentation/widgets/profile_common/best_ranking_widget.dart';
import 'package:skill_bit/features/profile/presentation/widgets/profile_common/growth_graph_widget.dart';
import 'package:skill_bit/features/profile/presentation/widgets/profile_common/progress_pie_char_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, this.hasBestRank = false});

  final bool hasBestRank;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: <Widget>[
        if (hasBestRank) ...<Widget>[const BestRankingWidget()],
        80.heightBox,
        const GrowthGraphWidget(),
        20.heightBox,
        const ProgressPieCharWidget(),
      ],
    );
  }
}
