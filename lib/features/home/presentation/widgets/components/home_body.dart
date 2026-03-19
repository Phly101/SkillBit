import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/courses/course_extenstions.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/course_card_widget.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/level_row_widget.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/path_details_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.courses,
    required this.currentLevel,
  });

  final List<CourseEntity> courses;
  final String currentLevel;

  @override
  Widget build(final BuildContext context) {
    return SliverMainAxisGroup(
      slivers: <Widget>[
        SliverToBoxAdapter(child: LevelRowWidget(currentLevel: currentLevel)),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: PathDetailsWidget(
            progressMade: courses.completedPercentage,
            progressLeft: courses.remainingPercentage,
            courseTitles: courses.courseTitles,
            lockedCourses: courses.lockedStatus,
            coursesListLength: courses.length,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Align(
            alignment: .centerLeft,
            child: Text('Your Courses', style: context.textTheme.displayLarge),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverList.builder(
          itemCount: courses.length,
          addAutomaticKeepAlives: false,
          itemBuilder: (final BuildContext context, final int index) {
            final CourseEntity coursesItem = courses[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CourseCardWidget(
                courseUrl: coursesItem.imageUrl,
                title: coursesItem.title,
                progress: coursesItem.progress,
                isLocked: coursesItem.isLocked,
              ),
            );
          },
        ),
      ],
    );
  }
}
