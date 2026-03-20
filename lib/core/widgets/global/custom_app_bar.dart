import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.iconBack});

  final String title;
  final IconButton? iconBack;

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: <Widget>[
        ?iconBack,
    
        Expanded(
          child: Center(
            child: Text(title, style: context.textTheme.displayLarge),
          ),
        ),
    
     
      ],
    );
  }
}
