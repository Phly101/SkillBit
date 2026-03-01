import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/app_colors.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/image_utils.dart';
import 'package:skill_bit/core/widgets/avatar_widget.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/shadow_container.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.profileUrl,
    required this.userName,
    required this.userPoints,
    this.badgeUrl,
  });

  final String profileUrl;
  final String userName;
  final String userPoints;
  final String? badgeUrl;

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            ImageUtils.showHeroPreview(
              context,
              profileUrl: profileUrl,
              heroTag: 'profile-pic',
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              // profile image
              ShadowContainer(
                shape: BoxShape.circle,
                color: Colors.transparent,
                blurRadius: 10,
                offset: const Offset(0, 5),
                child: Hero(
                  tag: 'profile-pic',
                  child: AvatarWidget(profileUrl: profileUrl, radius: 35),
                ),
              ),

              // The Badge
              Positioned(
                bottom: -10,
                right: -6,
                child: ShadowContainer(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                  child: Image.asset(
                    Assets.icon('bronze_badge.png'),
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
        ),

        10.heightBox,
        Text(
          userName,
          style: context.textTheme.bodySmall!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        ShaderMask(
          shaderCallback: (final Rect bounds) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[AppColors.primary, AppColors.secondary],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: Text(
            userPoints,
            style: context.textTheme.bodySmall!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
