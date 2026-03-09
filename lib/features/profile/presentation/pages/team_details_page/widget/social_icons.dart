import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    super.key,
    required this.function,
    this.icon,
    this.logoUrl,
  });

  final void Function() function;
  final IconData? icon;
  final String? logoUrl;

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: function,
      child: icon != null ? Icon(icon,size: 30,) : SizedBox(
          width: 35,
          height: 35,
          child: Image.asset(logoUrl!, fit: .fitWidth,)),
    ).pH(3);
  }
}
