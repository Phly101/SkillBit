import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/image_utils.dart';
import 'package:skill_bit/core/widgets/profile_guard_widget.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({
    super.key,
    this.profileUrl,
    required this.name,
    required this.email, this.badgeUrl,
  });

  final String? profileUrl;
    final String? badgeUrl;

  final String name;
  final String email;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              ImageUtils.showHeroPreview(
                context: context,
                heroTag: 'profile-hero',
                profileUrl: profileUrl ?? '',
                showEditButton: true,
              );
            },
            child: ProfileGuardWidget(
              profileUrl: profileUrl ?? '',
              radius: 60,
                badgeUrl: badgeUrl          ),


          ),
          16.heightBox,
          Text(
            name,
            style: context.textTheme.displayLarge?.copyWith(fontSize: 22),
          ),
          4.heightBox,
          Text(
            email,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
