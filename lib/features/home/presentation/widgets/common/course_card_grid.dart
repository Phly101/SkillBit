import 'package:flutter/material.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/course_card_widget.dart';

class CourseCardGrid extends StatelessWidget {
  const CourseCardGrid({
    super.key,
    required this.itemCount,
    required this.title,
    required this.imageUrl,
    required this.progress,
  });

  final int? itemCount;
  final String? title;
  final String? imageUrl;
  final double? progress;

  @override
  Widget build(final BuildContext context) {
    if (itemCount == null || itemCount == 0) {
      return const SizedBox.shrink();
    }
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        delegate: SliverChildBuilderDelegate((
          final BuildContext context,
          final int index,
        ) {
          return CourseCardWidget(
            title: title ?? 'Course $index',
            imageUrl: imageUrl ?? '',
            progress: progress ?? 0,
          );
        }, childCount: itemCount),
      ),
    );
  }
}
