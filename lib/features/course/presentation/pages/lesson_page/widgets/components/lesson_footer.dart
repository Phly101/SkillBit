import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/course/domain/entities/resource_entity.dart';
import 'package:skill_bit/features/course/presentation/pages/lesson_page/widgets/common/resource_block.dart';

class LessonFooter extends StatelessWidget {
  const LessonFooter({
    super.key,
    required this.resourceList,
    required this.lessonId,
    required this.courseId,
  });

  final List<ResourceEntity>? resourceList;
  final String? lessonId;
  final String? courseId;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: <Widget>[
        Text(
          'Lesson Resources:',
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        Divider(color: context.colorScheme.outline.withValues(alpha: 0.6)),
        const SizedBox(height: 30),
        ResourceBlock(
          resourceList: resourceList ?? <ResourceEntity>[],
          lessonId: lessonId ?? '',
          courseId: courseId ?? '',
        ),
      ],
    );
  }
}
