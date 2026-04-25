import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'profile_guard_widget.dart';

class PodiumWidget extends StatelessWidget {
  const PodiumWidget({
    super.key,
    required this.standing,
    required this.profileUrl,
    required this.heroTag,
    this.badgeUrl,
    this.paddingTop = 20,
    this.radius,
    this.width = 30,
    this.height = 30,
  });

  final String standing;
  final String profileUrl;
  final String? badgeUrl;
  final double paddingTop;
  final double? radius;
  final String heroTag;
  final double? width;
  final double? height;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Column(
        children: <Widget>[
          // Label or Crown
          Text(
            standing,
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.tertiary,
            ),
          ),
          const SizedBox(height: 8),
          ProfileGuardWidget(
            profileUrl: profileUrl,
            badgeUrl: badgeUrl,
            radius: radius,
            heroTag: heroTag,
            needsHero: true,
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }
}
