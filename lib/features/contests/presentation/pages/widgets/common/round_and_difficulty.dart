import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/contest_details_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';

class RoundAndDifficulty extends StatelessWidget {
  const RoundAndDifficulty({super.key});

  @override
  Widget build(final BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    ContestStrings.round1,
                    style: context.textTheme.displayMedium?.copyWith(
                      color: context.colorScheme.onSurface,
                      fontSize: 18
                    ),
                  ),
                  Container(
                    width: 163,
                    height: 31,
                    decoration: BoxDecoration(
                      color:context.colorScheme.secondary, 
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        ContestStrings.medium,
                        style: context.textTheme.displayMedium,
                      ),
                    ),
                  ),
                ],
              ).pH(13).pV(17);
  }
}
