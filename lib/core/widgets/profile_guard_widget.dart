import 'package:flutter/material.dart';
import 'package:skill_bit/core/utils/global/image_utils.dart';
import 'package:skill_bit/core/widgets/shadow_container.dart';
import '../utils/global/assets.dart';
import 'avatar_widget.dart';

class ProfileGuardWidget extends StatelessWidget {
  const ProfileGuardWidget({
    super.key,
    required this.profileUrl,
    this.heroTag,
    this.needsHero = false,
    this.badgeUrl,
    this.radius = 35,
    this.size = 35,
  }) : assert(
         badgeUrl == null || badgeUrl != '',
         'If you provide a badgeUrl, it cannot be empty',
       );

  final String profileUrl;
  final String? heroTag;
  final bool needsHero;
  final String? badgeUrl;
  final double? radius;
  final double size;

  @override
  Widget build(final BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        // profile image
        ShadowContainer(
          shape: BoxShape.circle,
          color: Colors.transparent,
          blurRadius: 10,
          offset: const Offset(0, 5),
          child: needsHero
              ? Hero(
                  tag: heroTag!,
                  child: InkWell(
                    onTap: (){
                      ImageUtils.showHeroPreview(
                        context: context,
                        profileUrl: profileUrl,
                        heroTag: heroTag!,
                      );
                    },
                    child: AvatarWidget(
                      profileUrl: profileUrl,
                      radius: radius,
                      size: size,
                    ),
                  ),
                )
              : AvatarWidget(
                  profileUrl: profileUrl,
                  radius: radius,
                  size: size,
                ),
        ),

        // The Badge
        if (badgeUrl != null && badgeUrl != '') ...<Widget>[
          Positioned(
            bottom: -10,
            right: -6,
            child: ShadowContainer(
              shape: BoxShape.circle,
              color: Colors.transparent,
              blurRadius: 8,
              offset: const Offset(0, 3),
              child: Image.asset(Assets.icon(badgeUrl!), width: 40, height: 40),
            ),
          ),
        ],
      ],
    );
  }
}
