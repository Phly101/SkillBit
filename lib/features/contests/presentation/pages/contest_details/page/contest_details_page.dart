import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import '../widgets/components/contest_details_body.dart';


class ContestDetailsPage extends StatelessWidget {
  const ContestDetailsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return const ContestDetailsBody().pH(10);
  }
}
