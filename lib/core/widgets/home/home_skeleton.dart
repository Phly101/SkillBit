import 'package:flutter/material.dart';
import '../global/shimmer_bone.dart';
import 'course_card_skeleton.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key});

  @override
  Widget build(final BuildContext context) {
    return SliverMainAxisGroup(
      slivers: <Widget>[
        // Header Section (Matches HomeHeaderWidget layout)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Row(
                  children: <Widget>[
                    ShimmerBone(width: 150, height: 20),
                    Spacer(),
                    // The Circular Avatar Skeleton
                    ShimmerBone(width: 70, height: 70, borderRadius: 35),
                  ],
                ),
                const ShimmerBone(width: 200, height: 30),
                // Greeting
                const SizedBox(height: 10),
                const ShimmerBone(width: 150, height: 20),
                // Assessment text
                const SizedBox(height: 30),
                ShimmerBone(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 50,
                ),
                // Search bar
              ],
            ),
          ),
        ),

        // Path/Level Section (Matches HomeBody layout)
        const SliverToBoxAdapter(
          child: ShimmerBone(width: 100, height: 20), // Level Indicator
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        const SliverToBoxAdapter(
          child: ShimmerBone(
            width: double.infinity,
            height: 120,
          ), // PathDetailsWidget
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 30)),

        // Courses List Title
        const SliverToBoxAdapter(child: ShimmerBone(width: 120, height: 30)),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),

        // Course List
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, final _) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CourseCardSkeleton(),
            ),
            childCount: 4,
          ),
        ),
      ],
    );
  }
}
