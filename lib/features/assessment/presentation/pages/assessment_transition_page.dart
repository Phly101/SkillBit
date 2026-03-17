import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/assessment_constants.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/transition_screen_widget.dart';

import '../../../../core/utils/global/assets.dart';

class AssessmentTransitionPage extends StatelessWidget {
  const AssessmentTransitionPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: TransitionScreenWidget(
              assetUrl: Assets.animation('online_test.json'),
              screenTitle: AssessmentConstants.title,
              description: AssessmentConstants.description,
              buttonText: AssessmentConstants.buttonText,
              function: //Todo: Implement Function logic
                  () {},
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              onPressed: //Todo: Implement Function logic
              () {
                context.go(AppRoutes.home);
              },
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 30,
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
