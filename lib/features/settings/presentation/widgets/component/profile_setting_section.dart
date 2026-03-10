import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skill_bit/core/constants/settings_strings.dart';
import 'package:skill_bit/core/widgets/shadow_container.dart';
import 'package:skill_bit/features/settings/presentation/widgets/common/profile_action_tile.dart';

class ProfileSettingSection extends StatelessWidget {
  const ProfileSettingSection({super.key, required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ShadowContainer(
          borderRadius: 12,
          child: Column(
            children: <Widget>[
              ProfileActionTile(
                icon: FontAwesomeIcons.userPen,
                title: name,
                subTitle: email,
                onTap: () {},
              ),

              ProfileActionTile(
                icon: FontAwesomeIcons.solidEnvelope,
                title: name,
                subTitle: email,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
