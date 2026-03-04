import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.icon,
    required this.link,
    this.iconColor,
  });

  final IconData icon;
  final String link;
  final Color? iconColor;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      children: <Widget>[
        Icon(icon,color: iconColor,),
        15.widthBox,

        Text(link, style: context.textTheme.bodyMedium),
      ],
    );
  }
}
