import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skill_bit/core/constants/settings_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/features/auth/presentation/Bloc/auth_bloc.dart';
import 'package:skill_bit/features/settings/domain/entities/settings_entity.dart';
import 'package:skill_bit/features/settings/presentation/widgets/common/profile_action_tile.dart';
import 'package:skill_bit/features/settings/presentation/widgets/component/profile_setting_section.dart';
import 'package:skill_bit/features/settings/presentation/widgets/component/settings_header.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key, required this.settingsEntity});

  final SettingsEntity settingsEntity;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        46.heightBox,
        SettingsHeader(
          profileUrl: settingsEntity.profilePicture,
          name: settingsEntity.fullname,
          email: settingsEntity.email,
          badgeUrl: 'camera_icon.png',
        ),
        50.heightBox,
        ProfileSettingSection(
          name: settingsEntity.fullname,
          email: settingsEntity.email,
        ),
        45.heightBox,
        Text(
          SettingsStrings.endSession,
          style: (context.textTheme.displayMedium ?? const TextStyle())
              .copyWith(fontSize: 18, color: context.colorScheme.outline),
        ),
        10.heightBox,
        // log out button
        ShadowContainer(
          borderRadius: 8,
          child: ProfileActionTile(
            icon: FontAwesomeIcons.rightFromBracket,
            title: SettingsStrings.logOut,
            onTap: () {
              context.read<AuthBloc>().add(const AuthLogoutRequested());
            },
            iconColor: context.colorScheme.error,
            iconBgColor: context.colorScheme.error.withValues(alpha: .12),
            arrowColor: context.colorScheme.error.withValues(alpha: 0.20),
          ),
        ),
      ],
    ).pH(16);
  }
}
