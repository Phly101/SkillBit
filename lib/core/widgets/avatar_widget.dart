import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key, required this.profileUrl, this.radius = 25});

  final String? profileUrl;
  final double? radius;

  @override
  Widget build(final BuildContext context) {
    return CircleAvatar(
      backgroundColor: profileUrl == null
          ? context.colorScheme.outline
          : Colors.transparent,
      radius: radius,
      backgroundImage: profileUrl != null ? AssetImage(profileUrl!) : null,
      child: profileUrl == null ? const Icon(Icons.person, size: 35) : null,
    );
  }
}
