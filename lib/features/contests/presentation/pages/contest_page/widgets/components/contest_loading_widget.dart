import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/quiz&contest_factory/contest_page/widgets/components/contest_page_skeleton.dart';

class ContestLoadingWidget extends StatelessWidget {
  const ContestLoadingWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return const QuizContestSkeleton();
  }
}
