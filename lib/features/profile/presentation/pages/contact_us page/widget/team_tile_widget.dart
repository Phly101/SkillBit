import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/image_utils.dart';
import 'package:skill_bit/core/utils/global/launch_external_url.dart';
import 'package:skill_bit/core/widgets/user/avatar_widget.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/features/profile/presentation/pages/team_details_page/widget/social_icons.dart';
import '../../../../../../core/utils/global/assets.dart';
import '../../team_details_page/page/team_details_page.dart';

class TeamTileWidget extends StatelessWidget {
  const TeamTileWidget({
    super.key,
    required this.profileUrl,
    required this.name,
    required this.role,
    required this.githubLink,
    required this.linkedInLink,
    required this.emailLink,
    required this.tag,
    required this.detailedName,
    required this.detailedRole,
    required this.about,
    required this.advice,
  });

  final String profileUrl;
  final String detailedName;
  final String detailedRole;
  final String name;
  final String role;
  final String githubLink;
  final String linkedInLink;
  final String emailLink;
  final String tag;
  final String about;
  final String advice;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (final BuildContext context) => TeamDetailsPage(
              name: detailedName,
              role: detailedRole,
              profileUrl: profileUrl,
              about: about,
              advice: advice,
              heroTag: tag,
            ),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: ShadowContainer(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // profile image
              InkWell(
                onTap: () {
                  ImageUtils.showHeroPreview(
                    context: context,
                    heroTag: tag,
                    profileUrl: profileUrl,
                  );
                },
                child: Hero(
                  tag: tag,
                  child: AvatarWidget(profileUrl: profileUrl, radius: 30),
                ),
              ),
              const SizedBox(width: 12),
              // title and role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: .w800,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: context.colorScheme.outline.withValues(
                          alpha: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Email
                  SocialIcons(
                    function: () {
                      LaunchExternalUrl.launchExternalUrl(
                        Uri(scheme: 'mailto', path: emailLink),
                      );
                    },
                    icon: Icons.mail,
                  ),
                  // Linked In
                  SocialIcons(
                    function: () {
                      LaunchExternalUrl.launchExternalUrl(
                        Uri.parse(linkedInLink),
                      );
                    },
                    logoUrl: Assets.icon('LinkedIn_icon.png'),
                  ),
                  // github
                  SocialIcons(
                    function: () {
                      LaunchExternalUrl.launchExternalUrl(
                        Uri.parse(githubLink),
                      );
                    },
                    logoUrl: Assets.icon('github_logo_icon.png'),
                  ),
                ],
              ),
            ],
          ).p10(),
        ),
      ).pV(20),
    );
  }
}
