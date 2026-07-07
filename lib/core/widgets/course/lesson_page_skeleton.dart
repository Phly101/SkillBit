import 'package:flutter/material.dart';
import 'package:skill_bit/core/widgets/global/shimmer_bone.dart';

class LessonPageSkeleton extends StatelessWidget {
  const LessonPageSkeleton({super.key});

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),

          // Header skeleton — back button + title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                ShimmerBone(width: 40, height: 40, borderRadius: 12),
                SizedBox(width: 12),
                ShimmerBone(width: 180, height: 22),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Body — image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const ShimmerBone(
                  width: double.infinity,
                  height: 220,
                  borderRadius: 16,
                ),

                const SizedBox(height: 20),

                // Description lines
                const ShimmerBone(width: double.infinity, height: 14),
                const SizedBox(height: 8),
                const ShimmerBone(width: double.infinity, height: 14),
                const SizedBox(height: 8),
                const ShimmerBone(width: double.infinity, height: 14),
                const SizedBox(height: 8),
                const ShimmerBone(width: 220, height: 14),

                const SizedBox(height: 32),

                // Footer — resources section label
                const ShimmerBone(width: 120, height: 18),
                const SizedBox(height: 16),

                // Resource cards
                _ResourceCardSkeleton(),
                const SizedBox(height: 12),
                _ResourceCardSkeleton(),
                const SizedBox(height: 12),
                _ResourceCardSkeleton(),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ResourceCardSkeleton extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return const Row(
      children: <Widget>[
        ShimmerBone(width: 48, height: 48, borderRadius: 12),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ShimmerBone(width: 160, height: 14),
            SizedBox(height: 6),
            ShimmerBone(width: 100, height: 12),
          ],
        ),
      ],
    );
  }
}
