import 'package:flutter/material.dart';
import '../../../../../../../core/widgets/global/shimmer_bone.dart';

class LessonPageLoadingStateWidget extends StatelessWidget {
  const LessonPageLoadingStateWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitleSkeleton(),
          const SizedBox(height: 20),
          _buildImageSkeleton(context),
          const SizedBox(height: 25),
          _buildTextBodySkeleton(),
          const SizedBox(height: 30),
          _buildPlaylistButtonSkeleton(),
        ],
      ),
    );
  }

  // Title Skeleton
  Widget _buildTitleSkeleton() {
    return const ShimmerBone(width: 200, height: 24);
  }

  // Main Image Skeleton
  Widget _buildImageSkeleton(final BuildContext context) {
    return ShimmerBone(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.25,
      borderRadius: 16,
    );
  }

  //Paragraph/Body Skeleton
  Widget _buildTextBodySkeleton() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ShimmerBone(width: double.infinity, height: 14),
        SizedBox(height: 8),
        ShimmerBone(width: double.infinity, height: 14),
        SizedBox(height: 8),
        ShimmerBone(width: double.infinity, height: 14),
        SizedBox(height: 8),
        ShimmerBone(width: 150, height: 14),
      ],
    );
  }

  //Action Button Skeleton
  Widget _buildPlaylistButtonSkeleton() {
    return const ShimmerBone(width: 120, height: 20);
  }
}
