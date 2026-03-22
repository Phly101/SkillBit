import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.cardText,
    required this.color,
    required this.answersNum,
  });

  final int answersNum;
  final Color color;
  final String cardText;

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      borderRadius: 8,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.circle, color: color,size: 35,),
              const SizedBox(width: 15),
              Text(
                answersNum.toString(),
                style: context.textTheme.displayLarge!.copyWith(color: color,
                fontSize: 24),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            cardText,
            style: context.textTheme.displayLarge!.copyWith(color: color,
            fontSize: 24),
          ),
        ],
      ).pNum(10),
    );
  }
}
