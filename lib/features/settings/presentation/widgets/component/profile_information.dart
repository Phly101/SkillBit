import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/app_colors.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/image_utils.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
    required this.name,
    required this.email,
    this.profileUrl,
  });

  final String name;
  final String email;
  final String? profileUrl;

  @override
  Widget build(final BuildContext context) {
    const String heroTag = 'profile-pic';

    return Center(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (profileUrl != null) {
                    ImageUtils.showHeroPreview(
                      context: context,
                      heroTag: heroTag,
                      profileUrl: profileUrl!,
                    );
                  }
                },
                child: Hero(
                  tag: heroTag,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: profileUrl == null
                        ? context.colorScheme.outline
                        : Colors.transparent,
                    backgroundImage: profileUrl != null
                        ? AssetImage(profileUrl!)
                        : null,
                    child: profileUrl == null
                        ? Icon(
                            Icons.person,
                            size: 60,
                            color: context.colorScheme.onSurfaceVariant,
                          )
                        : null,
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.brandBlue,
                    child: Icon(
                      Icons.camera_alt,
                      color: AppColors.surface,
                      size: 20,
                    ),
                  ).pNum(4),
                ),
              ),
            ],
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
