import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';

import '../../../../../../../core/router/routes.dart';
import '../../../../../../../core/theme/theme.dart';
import '../../../../../../../core/widgets/global/button_widget.dart';

class LessonHeader extends StatelessWidget {
  const LessonHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: <Widget>[
        ArrowBackButton(function: () => context.go(AppRoutes.home),size: 30,),
        Row(
          children: <Widget>[
            ButtonWidget(
              paddingR: 8,
              paddingL: 8,
              paddingB: 8,
              paddingT: 8,
              child: FaIcon(
                FontAwesomeIcons.bars,
                color: context.colorScheme.onSurface,
              ),
              function: //Todo: Implement Function logic
              () {
                Scaffold.of(context).openDrawer();
              },
            ),
            const SizedBox(width: 20,),
            Text(title, style: context.textTheme.displayLarge),
          ],
        ),
      ],
    );
  }
}
