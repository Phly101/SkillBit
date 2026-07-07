import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/image_utils.dart';
import 'package:skill_bit/core/widgets/user/profile_network_gaurd.dart';
import 'package:skill_bit/features/settings/presentation/Bloc/settings_bloc.dart';

import '../../../../../core/utils/global/upload_image.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({
    super.key,
    this.profileUrl,
    required this.name,
    required this.email,
    this.badgeUrl,
  });

  final String? profileUrl;
  final String? badgeUrl;

  final String name;
  final String email;

  Future<void> _pickAndUpload(final BuildContext context) async {
    final File? image = await ImagePickerUtils.pickFromGallery(
      imageQuality: 80,
    );
    if (image == null) return;

    if (!context.mounted) return;

    context.read<SettingsBloc>().add(UploadImageEvent(imagePath: image.path));
  }

  void _onAvatarTap(final BuildContext context) {
    final bool hasImage = (profileUrl ?? '').isNotEmpty;

    if (!hasImage) {
      _pickAndUpload(context);
      return;
    }

    ImageUtils.showHeroPreview(
      context: context,
      heroTag: 'profile-hero',
      profileUrl: profileUrl ?? '',
      haveEditButton: true,
      onEditPressed: () => _pickAndUpload(context),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => _onAvatarTap(context),
            child: ProfileNetworkGuardWidget(
              profileUrl: profileUrl ?? '',
              radius: 60,
              badgeUrl: badgeUrl,
            ),
          ),
          16.heightBox,
          Text(
            name,
            style: context.textTheme.displayLarge?.copyWith(fontSize: 22),
          ),
          4.heightBox,
          Text(
            email,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
