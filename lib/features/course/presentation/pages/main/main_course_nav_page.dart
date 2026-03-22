import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/features/courses/course_item_icon_decider.dart';
import 'package:skill_bit/core/utils/global/state_switcher.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';
import 'package:skill_bit/features/course/presentation/Bloc/courseDetails/course_details_bloc.dart';
import 'package:skill_bit/features/course/presentation/pages/main/widgets/components/course_drawer.dart';
import '../../../../../core/di/injection_container.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/widgets/global/nav_tile_widget.dart';

class MainCourseNavigationPage extends StatelessWidget {
  const MainCourseNavigationPage({
    super.key,
    required this.body,
    required this.courseId,
  });

  final Widget body;
  final String? courseId;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<CourseDetailsBloc>(
      create: (final BuildContext context) =>
          sl<CourseDetailsBloc>()
            ..add(LoadCourseDetails(courseId: courseId ?? '')),
      child: Scaffold(
        drawer: StateSwitcher<CourseDetailsBloc, CourseDetailsState>(
          onInitial: (final BuildContext context, final Object? state) =>
              const SizedBox.shrink(),
          loadingWidget: const Center(child: CircularProgressIndicator()),
          onError:
              (
                final String error,
                final BuildContext context,
                final CourseDetailsState state,
              ) => Center(
                child: Text(
                  error,
                  style: context.textTheme.displayLarge!.copyWith(
                    color: context.colorScheme.error,
                  ),
                ),
              ),
          onSuccess: (final BuildContext context, final Object? mainPageState) {
            final CourseDetailSuccess successState =
                mainPageState as CourseDetailSuccess;
            final CourseEntity course = successState.course;
            final String courseId = course.id;
            final List<Widget> drawerWidgets =
                course.lessons?.expand((final LessonEntity lesson) {
                  return <NavTileWidget>[
                    // The Lesson Tile
                    NavTileWidget(
                      title: lesson.title,
                      isIcon: true,
                      icon: CourseItemIconDecider.decideLessonIcon(
                        lesson.isLocked,
                      ),
                      iconColor: !lesson.isLocked
                          ? context.colorScheme.onError
                          : context.colorScheme.onSurface,
                      size: 30,
                      function: //Todo: Implement Function logic
                      () {
                        if (!lesson.isLocked) {
                          context.go(
                            '${AppRoutes.course}/$courseId/lesson/${lesson.id}',
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),

                    //  The Quiz Tile
                    if (lesson.quiz != null)
                      NavTileWidget(
                        title: '${lesson.title} Quiz',
                        isIcon: true,
                        icon: CourseItemIconDecider.decideQuizIcon(
                          lesson.isLocked,
                          lesson.quiz!.icCompleted,
                        ),
                        iconColor: lesson.quiz!.icCompleted
                            ? context.colorScheme.onError
                            : context.colorScheme.onSurface,
                        size: 30,
                        function: //Todo: Implement Function logic
                        () {
                          if (!lesson.isLocked) {
                            context.go(
                              '${AppRoutes.course}/$courseId/lesson/${lesson.id}/quiz/${lesson.quiz!.id}',
                            );
                            Navigator.pop(context);
                          }
                        },
                      ),
                  ];
                }).toList() ??
                <Widget>[];

            return CourseDrawer(drawerItems: drawerWidgets);
          },
        ),
        body: body,
      ),
    );
  }
}
