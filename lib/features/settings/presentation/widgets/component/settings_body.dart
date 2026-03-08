import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skill_bit/core/constants/settings_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/assets.dart';
import 'package:skill_bit/core/widgets/shadow_container.dart';
import 'package:skill_bit/features/settings/presentation/widgets/common/profile_action_tile.dart';
import 'package:skill_bit/features/settings/presentation/widgets/component/profile%20information.dart';
import 'package:skill_bit/features/settings/presentation/widgets/component/profile_setting_section.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(final BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
    46.heightBox,
      ProfileInformation(
        profileUrl: Assets.image('Menna_image.jpeg'),
        name: SettingsStrings.userName, email: SettingsStrings.userEmail),
        50.heightBox,
        const ProfileSettingSection(),
          45.heightBox,
        Text(SettingsStrings.endSession,style:(context.textTheme.displayMedium ?? const TextStyle()).copyWith(
          fontSize: 18,
          color: context.colorScheme.outline,
        ),),
        10.heightBox,

        ShadowContainer(
          
          borderRadius: 8,
          child:ProfileActionTile(
          icon: FontAwesomeIcons.rightFromBracket,
          title: SettingsStrings.logOut,
          onTap: () {
          },
          iconColor: context.colorScheme.error,
          iconBgColor: context.colorScheme.error.withValues(alpha: .12),
          arrowColor: context.colorScheme.error.withValues(alpha: 0.20),
        ) )
        

     ],
    ).pH(16);
  }
}
