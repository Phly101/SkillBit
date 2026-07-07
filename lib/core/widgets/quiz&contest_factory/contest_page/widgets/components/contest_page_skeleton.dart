import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/shimmer_bone.dart';

import '../common/question_skeleton.dart';

class QuizContestSkeleton extends StatelessWidget {
  const QuizContestSkeleton({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),

            //================ Timer =================
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ShimmerBone(width: 42, height: 42, borderRadius: 21),
                SizedBox(width: 14),
                ShimmerBone(width: 170, height: 34),
              ],
            ),

            20.heightBox,

            //================ Page Indicator =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ShimmerBone(width: 120, height: 24),
              ),
            ),

            10.heightBox,

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ShimmerBone(
                width: double.infinity,
                height: 10,
                borderRadius: 5,
              ),
            ),

            30.heightBox,

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const QuestionSkeleton(),
                    20.heightBox,
                    const QuestionSkeleton(),

                    30.heightBox,

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ShimmerBone(width: 120, height: 48, borderRadius: 10),
                        ShimmerBone(width: 120, height: 48, borderRadius: 10),
                      ],
                    ),

                    30.heightBox,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
