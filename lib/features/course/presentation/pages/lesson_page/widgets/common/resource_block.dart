import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_bit/features/course/domain/entities/enums/resource_type.dart';
import 'package:skill_bit/features/course/domain/entities/resource_entity.dart';
import 'package:skill_bit/features/course/presentation/Bloc/lessonDetails/lesson_details_bloc.dart';
import 'package:skill_bit/features/course/presentation/pages/lesson_page/widgets/common/resources_tile.dart';

class ResourceBlock extends StatelessWidget {
  const ResourceBlock({
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
      children:
          resourceList?.map((final ResourceEntity resourceItem) {
            final bool isYouTube = resourceItem.type == ResourceType.youTube;
            return ResourcesTile(
              type: resourceItem.type,
              function: () {
                if (isYouTube) {
                  context.read<LessonDetailsBloc>().add(
                    WatchVideoEvent(
                      url: resourceItem.url,
                      videoId: resourceItem.id,
                      lessonId: lessonId ?? '',
                      courseId: courseId ?? '',
                    ),
                  );
                } else {
                  context.read<LessonDetailsBloc>().add(
                    VisitArticleEvent(
                      url: resourceItem.url,
                      articleId: resourceItem.id,
                      lessonId: lessonId ?? '',
                      courseId: courseId ?? '',
                    ),
                  );
                }
              },
            );
          }).toList() ??
          <Widget>[],
    );
  }
}
