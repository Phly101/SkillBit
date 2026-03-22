import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/assets.dart';

class AchievmentWidget extends StatelessWidget {

  const AchievmentWidget({
    super.key,
    required this.trophyImage,
    required this.title,
  });
  final String trophyImage;
  final String title;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              Assets.icon('frame_ach.png'),
              width:160,
              height:160,
              fit: BoxFit.contain,
            ),
            Image.asset(
              trophyImage,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
        4.heightBox,
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
