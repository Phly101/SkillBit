import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import '../../../../../core/router/routes.dart';
import '../common/course_card_widget.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({super.key, required this.courses});

  final List<CourseEntity> courses;

  @override
  Widget build(final BuildContext context) {
    return SliverList.builder(
      itemCount: courses.length,
      addAutomaticKeepAlives: false,
      itemBuilder: (final BuildContext context, final int index) {
        final CourseEntity coursesItem = courses[index];
        return CourseCardWidget(
          courseId: coursesItem.id,
          courseUrl: coursesItem.imageUrl,
          title: coursesItem.title,
          progress: coursesItem.progress,
          isLocked: coursesItem.isLocked,
          function: //Todo: Implement Function logic
          () {
            if (!coursesItem.isLocked) {
              context.go(
                '${AppRoutes.course}/${coursesItem.id}}',
              );
            }
            //Todo: add else clause with show dialoge
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Finish previous courses to unlock!'),
              ),
            );
          },
        );
      },
    );
  }
}
