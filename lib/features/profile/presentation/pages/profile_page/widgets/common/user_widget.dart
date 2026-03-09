import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/app_colors.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/image_utils.dart';
import 'package:skill_bit/core/widgets/profile_guard_widget.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.profileUrl,
    required this.userName,
    required this.userPoints,
    required this.badgeUrl,
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
        // profile image
        GestureDetector(
          onTap: () {
            ImageUtils.showHeroPreview(
              context: context,
              profileUrl: profileUrl,
              heroTag: 'profile-pic',
            );
          },
          child: ProfileGuardWidget(
            profileUrl: profileUrl,
            badgeUrl: badgeUrl,
            heroTag: 'profile-pic',
          ),
        ),

        10.heightBox,
        // user name
        Text(
          userName,
          style: context.textTheme.bodySmall!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        // score
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
    ).pH(15);
  }
}
