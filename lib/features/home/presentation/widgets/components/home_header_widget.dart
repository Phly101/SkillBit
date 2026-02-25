import 'package:flutter/material.dart';
import 'package:skill_bit/core/constants/home_strings.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/notification_widget.dart';

import '../../../../../core/utils/assets.dart';
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
            CircleAvatar(
              backgroundColor: context.colorScheme.outline,
              radius: 25,
              child: (profileUrl!=null)
                  ? Image.asset(
                      Assets.image(profileUrl!),
                    )
                  : const Icon(Icons.person,size: 35,),

            ),
          ],
        ),
        30.heightBox,
        const Row(
          mainAxisAlignment: .spaceBetween,
          children: <Widget>[SearchFieldWidget(), NotificationButton()],
        ),
        25.heightBox,
        Align(
          alignment: const Alignment(-0.98, 0),
          child: Text(
            HomeStrings.explore,
            style: context.textTheme.displayMedium!.copyWith(
              fontSize: 18,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
        15.heightBox,
      ],
    );
  }
}
