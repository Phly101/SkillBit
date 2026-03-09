import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'profile_guard_widget.dart';


class PodiumWidget extends StatelessWidget {
  const PodiumWidget({
    super.key,
    required this.label,
    required this.profileUrl,
    this.badgeUrl,
    this.paddingTop = 20,
    this.radius,
  });

  final String label;
  final String profileUrl;
  final String? badgeUrl;
  final double paddingTop;
  final double? radius;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Column(
        children: <Widget>[
          // Label or Crown
          Text(
            label,
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.tertiary,
            ),
          ),
          const SizedBox(height: 8),
          ProfileGuardWidget(
            profileUrl: profileUrl,
            badgeUrl: badgeUrl,
            radius: radius,
          ),
        ],
      ),
    );
  }
}
