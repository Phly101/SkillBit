import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/image_utils.dart';
import 'package:skill_bit/core/widgets/avatar_widget.dart';
import 'package:skill_bit/core/widgets/shadow_container.dart';
import '../../../../../../../core/theme/app_colors.dart';
import 'action_button.dart';

class FriendListCard extends StatelessWidget {
  const FriendListCard({
    super.key,
    required this.name,
    required this.points,
    required this.progress,
    required this.profileUrl,
  });

  final String name;
  final String profileUrl;
  final int points;
  final double progress;

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      borderRadius: 12,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  ImageUtils.showHeroPreview(context: context,
                      heroTag: 'hero-$name',
                      profileUrl: profileUrl);
                },
                child: AvatarWidget(
                  profileUrl: profileUrl,
                  radius: 35,
                  size: 35,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: const Color(0xffCFDBE8),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.mainBlue,
                      ),
                      minHeight: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '$points Points',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              ActionButton(
                label: 'View Profile',
                onTap: //Todo: Implement Function logic
                    () {},
              ),
              const SizedBox(width: 10),
              ActionButton(
                label: 'Challenge',
                isPrimary: false,
                onTap: //Todo: Implement Function logic
                    () {},
              ),
            ],
          ),
        ],
      ).pNum(12),
    );
  }
}
