import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skill_bit/core/theme/app_colors.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/shadow_container.dart';

class ProfileActionTile extends StatelessWidget {
  const ProfileActionTile({
    super.key,
    required this.icon,
    required this.title,
    this.subTitle,
    required this.onTap,
    this.iconColor,
    this.iconBgColor,
    this.arrowColor,
  });

  final IconData icon;
  final String title;
  final String? subTitle; // Nullable
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? iconBgColor;
  final Color? arrowColor;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          ShadowContainer(
           borderRadius: 8,
            color: iconBgColor ?? AppColors.brandBlue.withValues(alpha: 0.15),
            child: Icon(
              icon,
              color: iconColor ?? AppColors.brandBlue,
              size: 20,
            ).pNum(10),
          ),

          16.widthBox,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize:
                  MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subTitle != null && subTitle!.isNotEmpty) ...<Widget>[
                  2.heightBox,
                  Text(
                    subTitle!,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),

          Icon(
            FontAwesomeIcons.angleRight,
            size: 14,
            color: arrowColor ?? context.colorScheme.outline,
          ),
        ],
      ).pNum(10),
    );
  }
}
