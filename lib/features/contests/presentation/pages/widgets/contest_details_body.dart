import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/contest_details_strings.dart';
import 'package:skill_bit/core/widgets/custom_app_par.dart';

class ContestDetailsBody extends StatelessWidget {
  const ContestDetailsBody({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Column(
      children: [
        
    CustomAppBar(title: ContestStrings.contest)
    ],);
  }
}
