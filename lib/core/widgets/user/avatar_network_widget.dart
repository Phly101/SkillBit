import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class AvatarNetworkWidget extends StatelessWidget {
  const AvatarNetworkWidget({
    super.key,
    required this.profileUrl,
    this.radius = 25,
    this.size = 35,
  });

  final String? profileUrl;
  final double? radius;
  final double size;

  @override
  Widget build(final BuildContext context) {
    final bool hasImage = profileUrl != null && profileUrl!.isNotEmpty;

    return CircleAvatar(
      backgroundColor: !hasImage
          ? context.colorScheme.outline.withValues(alpha: 0.5)
          : Colors.transparent,
      radius: radius,

      backgroundImage: hasImage
          ? CachedNetworkImageProvider(profileUrl ?? 'temp_image.png')
          : null,
      child: !hasImage
          ? Icon(Icons.person, size: size, color: context.colorScheme.onSurface)
          : null,
    );
  }
}
