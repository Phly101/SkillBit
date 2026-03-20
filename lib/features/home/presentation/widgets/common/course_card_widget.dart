import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/widgets/global/line_progress_widget.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/status_container.dart';
import '../../../../../core/utils/global/assets.dart';

class CourseCardWidget extends StatelessWidget {
  const CourseCardWidget({
    super.key,
    required this.courseUrl,
    required this.title,
    required this.progress,
    required this.isLocked,
  });

  final String courseUrl;
  final String title;
  final double progress;
  final bool isLocked;

  @override
  Widget build(final BuildContext context) {
    return ShadowContainer(
      borderRadius: 25,
      border: Border(
        left: BorderSide(
          color: isLocked ? Colors.transparent : context.colorScheme.primary,
          width: 6,
        ),
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 5),
          Container(
            width: MediaQuery.widthOf(context) * 0.35,
            height: MediaQuery.heightOf(context) * 0.13,
            decoration: BoxDecoration(
              border: .all(width: 0.5, color: context.colorScheme.tertiary),
              borderRadius: BorderRadius.circular(25),
              color: context.colorScheme.secondary,
              image: DecorationImage(
                image: AssetImage(Assets.imageCourse(courseUrl)),
                fit: .fill,
              ),
            ),
          ).p10(),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        style: context.textTheme.bodyLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    StatusContainer(isLocked: isLocked, progress: progress),
                  ],
                ),
                const SizedBox(height: 10),
                LineProgressWidget(progress: progress),
              ],
            ),
          ),
        ],
      ).p10(),
    ).pNum(5);
  }
}
