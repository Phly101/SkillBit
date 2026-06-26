import 'package:flutter/material.dart';
import 'package:skill_bit/core/utils/global/image_utils.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import '../../utils/global/assets.dart';
import 'avatar_network_widget.dart';


class ProfileNetworkGuardWidget extends StatelessWidget {
  const ProfileNetworkGuardWidget({
    super.key,
    required this.profileUrl,
    this.heroTag,
    this.needsHero = false,
    this.badgeUrl,
    this.radius = 35,
    this.size = 35,
    this.width = 40,
    this.height = 40,
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
  final double? width;
  final double? height;

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
              onTap: () {
                ImageUtils.showHeroPreview(
                  context: context,
                  profileUrl: profileUrl,
                  heroTag: heroTag!,
                );
              },
              child: AvatarNetworkWidget(
                profileUrl: profileUrl,
                radius: radius,
                size: size,
              ),
            ),
          )
              : AvatarNetworkWidget(
            profileUrl: profileUrl,
            radius: radius,
            size: size,
          ),
        ),

        // The Badge
        if (badgeUrl != null && badgeUrl != '') ...<Widget>[
          Positioned(
            bottom: -(size * 0.15),
            right: -(size * 0.05),
            child: ShadowContainer(
              shape: BoxShape.circle,
              color: Colors.transparent,
              blurRadius: size * 0.2,
              offset: Offset(0, size * 0.08),
              child: Image.asset(
                Assets.badge(
                  badgeUrl!.endsWith('.png') ? badgeUrl! : '$badgeUrl.png',
                ),
                width: width! * 1.1,
                height: height! * 1.1,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
