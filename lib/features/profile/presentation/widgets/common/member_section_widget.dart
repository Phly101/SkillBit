import 'package:flutter/material.dart';

import '../../../../../core/theme/theme.dart';
import '../../../../../core/widgets/shadow_container.dart';

class MemberSectionWidget extends StatelessWidget {
  const MemberSectionWidget({
    super.key,
    required this.title,
    required this.content,
    this.icon,
    this.iconColor,
  });

  final String title;
  final String content;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                if (icon != null)
                  Icon(
                    icon,
                    color: iconColor ?? context.colorScheme.onSurface,
                    size: 18,
                  ),
                if (icon != null) const SizedBox(width: 8.0),
                Text(
                  title,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(content, style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
