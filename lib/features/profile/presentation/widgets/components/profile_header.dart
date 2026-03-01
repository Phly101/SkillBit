import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/button_widget.dart';
import 'package:skill_bit/features/profile/presentation/widgets/common/user_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.profileUrl,
    required this.userName,
    required this.userPoints,
  });

  final String profileUrl;
  final String userName;
  final String userPoints;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: <Widget>[
        // drawer button
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Builder(
            builder: (final BuildContext context) {
              return ButtonWidget(
                paddingR: 8,
                paddingL: 8,
                paddingB: 8,
                paddingT: 8,
                child: FaIcon(
                  FontAwesomeIcons.bars,
                  color: context.colorScheme.onSurface,
                ),
                function: //Todo: Implement Function logic
                () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        Spacer(),
        // user info
        UserWidget(
          profileUrl: profileUrl,
          userName: userName,
          userPoints: userPoints,
        ),
      ],
    ).pV(60);
  }
}
