import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/core/widgets/global/shimmer_bone.dart';

class ContestDetailsBodySkeleton extends StatelessWidget {
  const ContestDetailsBodySkeleton({super.key});

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          44.heightBox,

          // ================= App Bar =================
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: ShimmerBone(
                width: 140,
                height: 24,
              ),
            ),
          ),

          30.heightBox,

          // ================= Contest Card =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ShadowContainer(
              borderRadius: 16,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    const ShimmerBone(width: 180, height: 24),
                    20.heightBox,

                    const ShimmerBone(width: 120, height: 70, borderRadius: 12),

                    20.heightBox,

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ShimmerBone(width: 70, height: 18),
                        ShimmerBone(width: 70, height: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          20.heightBox,

          Divider(
            thickness: 1,
            color: context.colorScheme.outline,
            indent: 15,
            endIndent: 15,
          ),

          40.heightBox,

          // ================= Register Button =================
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ShimmerBone(
              width: double.infinity,
              height: 54,
              borderRadius: 12,
            ),
          ),

          40.heightBox,

          // ================= About Title =================
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ShimmerBone(width: 150, height: 22),
            ),
          ),

          20.heightBox,

          // ================= Description =================
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                ShimmerBone(width: double.infinity, height: 14),
                SizedBox(height: 10),
                ShimmerBone(width: double.infinity, height: 14),
                SizedBox(height: 10),
                ShimmerBone(width: double.infinity, height: 14),
                SizedBox(height: 10),
                ShimmerBone(width: 260, height: 14),
                SizedBox(height: 10),
                ShimmerBone(width: double.infinity, height: 14),
                SizedBox(height: 10),
                ShimmerBone(width: 200, height: 14),
              ],
            ),
          ),

          30.heightBox,
        ],
      ),
    );
  }
}
