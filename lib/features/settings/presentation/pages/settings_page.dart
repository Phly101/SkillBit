import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/settings_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';
import 'package:skill_bit/features/settings/domain/entities/settings_entity.dart';
import 'package:skill_bit/features/settings/presentation/widgets/component/settings_body.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SettingsStrings.settings,
          style: context.textTheme.displayLarge,
        ),
        centerTitle: true,
        leading: ArrowBackButton(function: () => context.pop()),
      ),
      //Todo: fix a bug where we can't open the image viewer if there is no image thus not being able to change image
      body: const SettingsBody(
        settingsEntity: SettingsEntity(
          name: SettingsStrings.userName,
          email: SettingsStrings.userEmail,
          profileImageUrl: 'basel_image.jfif',
          imageUrl: 'camera_icon.png',
        ),
      ),
    );
  }
}
