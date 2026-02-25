import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/course_card_widget.dart';
import 'package:skill_bit/features/home/presentation/widgets/components/home_header_widget.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HomeHeaderWidget(
            name: 'Basel',
            onTap: //Todo: Implement Function logic
            () {
              context.go(AppRoutes.assessment);
            },
          ),
          CourseCardWidget(
            title: 'test',
            imageUrl: Assets.imageLogo('Depth 4, Frame 0.png'),
            progress: 0.6,
          ),
        ],
      ).pH(10),
    ).pV(60);
  }
}
