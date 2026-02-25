import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/theme.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: //Todo: Implement Function logic
          () {},
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.mainGrey.withValues(alpha: 0.8),
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(
          Icons.notifications,
          color: context.colorScheme.secondary,
          size: 35,
        ),
      ),
    );
  }
}
