import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';

class NavTileWidget extends StatelessWidget {
  const NavTileWidget({
    super.key,
    required this.title,
    required this.isIcon,
    this.icon,
    this.imageUrl,
    this.function,
    this.size = 25,
    this.scale,
    this.iconColor,
  });

  final String title;
  final IconData? icon;
  final String? imageUrl;
  final bool isIcon;
  final double? size;
  final double? scale;
  final Color? iconColor;
  final void Function()? function;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ShadowContainer(
        child: ListTile(
          onTap: function,
          leading: isIcon
              ? FaIcon(
                  icon,
                  size: size,
                  color: iconColor ?? context.colorScheme.onSurface,
                )
              : Image.asset(imageUrl!, scale: scale),
          title: Text(
            title,
            maxLines: 2,
            overflow: .ellipsis,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const FaIcon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
