import 'package:flutter/material.dart';

import 'package:skill_bit/core/widgets/global/shimmer_bone.dart';

class CourseIntroSkeleton extends StatelessWidget {
  const CourseIntroSkeleton({super.key});

  @override
  Widget build(final BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Hero image skeleton
          ShimmerBone(width: double.infinity, height: 300, borderRadius: 28),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Type chip skeleton
                ShimmerBone(width: 90, height: 28, borderRadius: 20),

                SizedBox(height: 16),

                // Description lines
                ShimmerBone(width: double.infinity, height: 14),
                SizedBox(height: 8),
                ShimmerBone(width: double.infinity, height: 14),
                SizedBox(height: 8),
                ShimmerBone(width: 200, height: 14),

                SizedBox(height: 32),

                Divider(),

                SizedBox(height: 24),

                // Section header
                Row(
                  children: <Widget>[
                    ShimmerBone(width: 22, height: 22, borderRadius: 4),
                    SizedBox(width: 8),
                    ShimmerBone(width: 140, height: 20),
                  ],
                ),

                SizedBox(height: 12),

                // Subtitle line
                ShimmerBone(width: double.infinity, height: 14),
                SizedBox(height: 6),
                ShimmerBone(width: 180, height: 14),

                SizedBox(height: 28),

                // CTA button
                ShimmerBone(
                  width: double.infinity,
                  height: 52,
                  borderRadius: 14,
                ),

                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
