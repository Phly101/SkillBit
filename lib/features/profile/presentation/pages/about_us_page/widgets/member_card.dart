import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/image_utils.dart';
import 'package:skill_bit/core/widgets/avatar_widget.dart';
import 'package:skill_bit/core/widgets/shadow_container.dart';


import '../../team_details_page/page/team_details_page.dart';



class MemberCard extends StatelessWidget {
  const MemberCard({
    super.key,
    required this.profileUrl,
    required this.tag,
    required this.name,
    required this.role,
    required this.bioPreview,
    required this.about,
    required this.advice,
  });

  final String profileUrl;
  final String tag;
  final String name;
  final String role;
  final String bioPreview;
  final String about;
  final String advice;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: //Todo: Implement Function logic
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (final BuildContext context) => TeamDetailsPage(
              name: name,
              role: role,
              profileUrl: profileUrl,
              about: about,
              advice: advice,
              heroTag: tag,
            ),
          ),
        );
      },
      child: ShadowContainer(
        borderRadius: 12.0,
        blurRadius: 10,
        margin: .zero,
        child: Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .start,
          children: <Widget>[
            Hero(
              tag: tag,
              child: GestureDetector(
                onTap: () {
                  ImageUtils.showHeroPreview(
                    context: context,
                    profileUrl: profileUrl,
                    heroTag: tag,
                  );
                },
                child: AvatarWidget(profileUrl: profileUrl, radius: 35),
              ),
            ),
            16.widthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: <Widget>[
                  Text(
                    name,
                    style: context.textTheme.displayMedium!.copyWith(
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  4.heightBox,
                  Text(
                    role,
                    style: context.textTheme.displayMedium!.copyWith(
                      fontSize: 14,
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                  6.heightBox,
                  Divider(color: context.colorScheme.outline),
                  Text(
                    bioPreview,
                    style: context.textTheme.displayMedium!.copyWith(
                      fontSize: 12,
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: context.colorScheme.onSurface,
            ),
          ],
        ).pNum(20),
      ),
    );
  }
}
