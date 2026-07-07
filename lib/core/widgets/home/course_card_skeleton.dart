import 'package:flutter/material.dart';

import '../global/shimmer_bone.dart';

class CourseCardSkeleton extends StatelessWidget {
  const CourseCardSkeleton({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: Row(
        children: <Widget>[
          ShimmerBone(width: 100, height: 100, borderRadius: 25),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ShimmerBone(width: 150, height: 20),
                SizedBox(height: 10),
                ShimmerBone(width: double.infinity, height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
