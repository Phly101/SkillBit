import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/core/widgets/global/shimmer_bone.dart';

class SettingsBodySkeleton extends StatelessWidget {
  const SettingsBodySkeleton({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        46.heightBox,

        Center(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  const ShimmerBone(
                    width: 110,
                    height: 110,
                    borderRadius: 55,
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const ShimmerBone(
                      width: 24,
                      height: 24,
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
              18.heightBox,
              const ShimmerBone(width: 170, height: 22),
              10.heightBox,
              const ShimmerBone(width: 220, height: 16),
            ],
          ),
        ),

        50.heightBox,

        // ============== Profile Settings Section ==============
        Column(
          children: List.generate(
            2,
            (final int index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ShadowContainer(
                borderRadius: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Row(
                    children: <Widget>[
                      const ShimmerBone(
                        width: 42,
                        height: 42,
                        borderRadius: 21,
                      ),
                      14.widthBox,
                      const Expanded(
                        child: ShimmerBone(width: double.infinity, height: 18),
                      ),
                      16.widthBox,
                      const ShimmerBone(width: 18, height: 18, borderRadius: 9),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        45.heightBox,

        // ================= End Session =================
        const ShimmerBone(width: 140, height: 20),

        10.heightBox,

        ShadowContainer(
          borderRadius: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: <Widget>[
                const ShimmerBone(width: 42, height: 42, borderRadius: 21),
                14.widthBox,
                const Expanded(
                  child: ShimmerBone(width: double.infinity, height: 18),
                ),
                16.widthBox,
                const ShimmerBone(width: 18, height: 18, borderRadius: 9),
              ],
            ),
          ),
        ),
      ],
    ).pH(16);
  }
}
