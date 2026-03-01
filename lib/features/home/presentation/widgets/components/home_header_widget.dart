import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/home_strings.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/avatar_widget.dart';
import 'package:skill_bit/core/widgets/button_widget.dart';

import '../common/search_field_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
    required this.name,
    required this.onTap,
    this.profileUrl,
  });

  final String? profileUrl;
  final String name;
  final void Function() onTap;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: const Alignment(-0.98, 0),
          child: Text(
            HomeStrings.greeting(name),
            style: context.textTheme.displayLarge,
          ),
        ),
        10.heightBox,
        Row(
          children: <Widget>[
            InkWell(
              onTap: onTap,
              child: Text(
                HomeStrings.assessmentExam,
                style: context.textTheme.displayMedium!.copyWith(
                  color: context.colorScheme.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Spacer(),
            AvatarWidget(profileUrl: profileUrl),
          ],
        ),
        30.heightBox,
        Row(
          mainAxisAlignment: .spaceBetween,
          children: <Widget>[
            const SearchFieldWidget(),
            ButtonWidget(
              function: //Todo: Implement Function logic
              () {
                context.go(AppRoutes.notifications);
              },
              child: Icon(
                Icons.notifications,
                color: context.colorScheme.secondary,
                size: 35,
              ),
            ),
          ],
        ),
        25.heightBox,

        // Align(
        //   alignment: const Alignment(-0.98, 0),
        //   child: Text(
        //     HomeStrings.explore,
        //     style: context.textTheme.displayMedium!.copyWith(
        //       fontSize: 18,
        //       color: context.colorScheme.onSurface,
        //     ),
        //   ),
        // ),
        15.heightBox,
      ],
    );
  }
}
