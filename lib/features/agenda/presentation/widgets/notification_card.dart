import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
  });

  final String? title;
  final String? date;
  final String? time;

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      child: ListTile(
        onTap: () {
          context.go(AppRoutes.notifications);
        },
        leading: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.outline.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: //Todo: Implement Function logic
                () {},
            child: FaIcon(
              FontAwesomeIcons.solidTrashCan,
              color: context.colorScheme.error,
              size: 22,
            ).p10(),
          ),
        ),
        title: Text(
          title ?? 'ex: C++',
          style: context.textTheme.labelLarge!.copyWith(
            color: context.colorScheme.onSurface,
            fontSize: 16,
          ),
        ),
        subtitle: time == null ? const Text('7:00 Pm') : Text(time!),
        trailing: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.outline.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: FaIcon(
            FontAwesomeIcons.bell,
            color: context.colorScheme.onSurface,
            size: 22,
          ).p10(),
        ),
      ),
    );
  }
}
