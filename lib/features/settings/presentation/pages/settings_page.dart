import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/settings_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            fontWeight: FontWeight.bold,
          ),
          onPressed: () => context.pop(),
        ),
      
      ),
      body: const SettingsBody(settingsEntity:
       SettingsEntity(name: SettingsStrings.userName, email: SettingsStrings.userEmail, profileImageUrl:null)
      
      ,),
    );
  }
}
