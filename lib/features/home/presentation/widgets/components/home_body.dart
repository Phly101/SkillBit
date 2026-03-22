import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/courses/course_extenstions.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/course_card_widget.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/level_row_widget.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/path_details_widget.dart';
import '../../../../../core/router/routes.dart';

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
                courseId: coursesItem.id,
                courseUrl: coursesItem.imageUrl,
                title: coursesItem.title,
                progress: coursesItem.progress,
                isLocked: coursesItem.isLocked,
                function: //Todo: Implement Function logic
                () {
                  if (!coursesItem.isLocked) {
                    if (coursesItem.progress == 0.0) {
                      context.go('${AppRoutes.course}/${coursesItem.id}');
                    } else {
                      final String firstLessonId =
                          coursesItem.lessons?.first.id ?? '';

                      context.go(
                        '${AppRoutes.course}/${coursesItem.id}/lesson/$firstLessonId',
                      );
                    }
                  }
                  //Todo: add else clause with show dialoge
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
