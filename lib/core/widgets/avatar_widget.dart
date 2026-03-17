import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../utils/global/assets.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.profileUrl,
    this.radius = 25,
    this.size = 35,
  });

  final String profileUrl;
  final double? radius;
  final double size;

  @override
  Widget build(final BuildContext context) {
    final bool hasImage = profileUrl.isNotEmpty;

    return CircleAvatar(
      backgroundColor: !hasImage
          ? context.colorScheme.outline.withValues(alpha: 0.5)
          : Colors.transparent,
      radius: radius,

      backgroundImage: hasImage ? AssetImage(Assets.image(profileUrl)) : null,
      child: !hasImage
          ? Icon(Icons.person, size: size, color: context.colorScheme.onSurface)
          : null,
    );
  }
}
