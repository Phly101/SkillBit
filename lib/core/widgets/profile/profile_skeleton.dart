import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/button_widget.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/core/widgets/global/shimmer_bone.dart';

class ProfileSkeleton extends StatelessWidget {
  const ProfileSkeleton({super.key, this.hasBestRank = false});

  final bool hasBestRank;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          //================ Header ================
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: ButtonWidget(
                    paddingL: 8,
                    paddingR: 8,
                    paddingT: 8,
                    paddingB: 8,
                    function: () {},
                    child: const ShimmerBone(
                      width: 28,
                      height: 28,
                      borderRadius: 6,
                    ),
                  ),
                ),

                const Spacer(),

                const Column(
                  children: <Widget>[
                    ShimmerBone(width: 110, height: 110, borderRadius: 55),
                    SizedBox(height: 16),
                    ShimmerBone(width: 140, height: 22),
                    SizedBox(height: 10),
                    ShimmerBone(width: 90, height: 18),
                  ],
                ),
              ],
            ),
          ),

          if (hasBestRank) ...<Widget>[
            const ShadowContainer(
              borderRadius: 16,
              child: SizedBox(
                height: 140,
                width: double.infinity,
                child: Center(
                  child: ShimmerBone(width: 220, height: 90, borderRadius: 12),
                ),
              ),
            ),
            40.heightBox,
          ],

          //================ Performance Growth ================
          const Align(
            alignment: Alignment.centerLeft,
            child: ShimmerBone(width: 180, height: 24),
          ),

          20.heightBox,

          ShadowContainer(
            borderRadius: 16,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const ShimmerBone(
                    width: double.infinity,
                    height: 220,
                    borderRadius: 12,
                  ),
                  20.heightBox,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ShimmerBone(width: 50, height: 16),
                      ShimmerBone(width: 50, height: 16),
                      ShimmerBone(width: 50, height: 16),
                      ShimmerBone(width: 50, height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),

          30.heightBox,

          //================ Progress ================
          const Align(
            alignment: Alignment.centerLeft,
            child: ShimmerBone(width: 180, height: 22),
          ),

          24.heightBox,

          const Center(
            child: ShimmerBone(width: 250, height: 250, borderRadius: 125),
          ),

          40.heightBox,
        ],
      ),
    );
  }
}
