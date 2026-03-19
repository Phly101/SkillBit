import 'package:flutter/material.dart';
import 'package:skill_bit/features/search/domain/entities/search_courses_entity.dart';
import '../common/course_card_widget.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({super.key, required this.courses});

  final List<SearchCourseEntity> courses;

  @override
  Widget build(final BuildContext context) {
    return SliverList.builder(
      itemCount: courses.length,
      addAutomaticKeepAlives: false,
      itemBuilder: (final BuildContext context, final int index) {
        final SearchCourseEntity coursesItem = courses[index];
        return CourseCardWidget(
          courseUrl: coursesItem.imageUrl,
          title: coursesItem.title,
          progress: coursesItem.progress,
          isLocked: coursesItem.isLocked,
        );
      },
    );
  }
}
