import 'package:flutter/material.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/course_card_widget.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import '../../../../../core/utils/assets.dart';
import 'animated_path_item.dart';

class CourseCardList extends StatelessWidget {
  const CourseCardList({
    super.key,
    required this.itemCount,
    required this.title,
    required this.imageUrl,
    // required this.progressPercentage,
    required this.isLocked,
    required this.currentUserLevel,
  });

  final int? itemCount;
  final String? title;
  final String? imageUrl;

  // final double? progressPercentage;
  final bool isLocked;

  final int currentUserLevel;

  @override
  Widget build(final BuildContext context) {
    final List<CourseEntity> mockCourses = <CourseEntity>[
      CourseEntity(
        id: '1',
        title: 'Introduction to C++',
        imageUrl: Assets.image('temp_image.png'),
        // Replace with your actual asset path
        progress: 1.0,
        // Completed
        isLocked: false,
      ),
      CourseEntity(
        id: '1',
        title: 'Variables & Data Types',
        imageUrl: Assets.image('temp_image.png'),
        progress: 1.0,
        // Completed
        isLocked: false,
      ),
      CourseEntity(
        id: '1',
        title: 'Control Flow',
        imageUrl: Assets.image('temp_image.png'),
        progress: 0.45,
        // Currently learning (Water animation will show)
        isLocked: false,
      ),
      CourseEntity(
        id: '1',
        title: 'Functions & Scope',
        imageUrl: Assets.image('temp_image.png'),
        progress: 0.0,
        isLocked: true, // Locked
      ),
      CourseEntity(
        id: '1',
        title: 'Arrays & Vectors',
        imageUrl: Assets.image('temp_image.png'),
        progress: 0.0,
        isLocked: true,
      ),
      CourseEntity(
        id: '1',
        title: 'Pointers & Memory',
        imageUrl: Assets.image('temp_image.png'),
        progress: 0.0,
        isLocked: true,
      ),
    ];
    // Inside CourseCardList build method
    return SliverList(
      delegate: SliverChildBuilderDelegate((
        final BuildContext context,
        final int index,
      ) {
        final CourseEntity course = mockCourses[index];

        // The path is "unlocked" (Gold) only if the current course is 100% done
        final bool pathIsGold = course.progress >= 1.0;

        return Column(
          children: <Widget>[
            Align(
              alignment: index % 2 == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: CourseCardWidget(
                  title: course.title,
                  imageUrl: course.imageUrl,
                  progress: course.progress,
                  isLocked: course.isLocked,
                ),
              ),
            ),
            if (index < mockCourses.length - 1)
              AnimatedPathItem(
                index: index,
                isNextLocked: !pathIsGold, // Use our logic!
              ),
          ],
        );
      }, childCount: mockCourses.length),
    );
  }
}
