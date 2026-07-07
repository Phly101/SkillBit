import 'package:flutter/material.dart';

import '../../../../../theme/theme.dart';
import '../../../../global/shimmer_bone.dart';

class QuestionSkeleton extends StatelessWidget {
  const QuestionSkeleton({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const ShimmerBone(width: double.infinity, height: 30),

        8.heightBox,

        const ShimmerBone(width: 260, height: 30),

        20.heightBox,

        ...List.generate(
          4,
          (_) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: <Widget>[
                  ShimmerBone(width: 30, height: 30, borderRadius: 15),
                  SizedBox(width: 16),
                  ShimmerBone(width: 24, height: 24, borderRadius: 12),
                  SizedBox(width: 16),
                  Expanded(
                    child: ShimmerBone(width: double.infinity, height: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
