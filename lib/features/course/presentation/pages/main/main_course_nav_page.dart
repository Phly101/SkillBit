import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/box_state_switcher.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';
import 'package:skill_bit/features/course/presentation/Bloc/courseDetails/course_details_bloc.dart';
import 'package:skill_bit/features/course/presentation/pages/main/widgets/components/course_drawer.dart';
import 'package:skill_bit/features/course/presentation/pages/main/widgets/components/lesson_drawer_tile.dart';
import 'package:skill_bit/features/course/presentation/pages/main/widgets/components/quiz_drawer_tile.dart';
import '../../../../../core/di/injection_container.dart';

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
      key: ValueKey('course_bloc_provider_$courseId'),
      create: (final BuildContext context) =>
          sl<CourseDetailsBloc>()
            ..add(LoadCourseDetails(courseId: courseId ?? '')),
      child: Scaffold(
        drawer: BoxStateSwitcher<CourseDetailsBloc, CourseDetailsState>(
          onInitial: (final BuildContext context, final CourseDetailsState state) =>
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
            final CourseDetailsEntity course = successState.course;

            final List<Widget> drawerItems = <Widget>[];
            for (final LessonViewEntity lesson in course.lessons) {
              drawerItems.add(
                LessonDrawerTile(
                  key: ValueKey('lesson_${lesson.id}'),
                  courseId: course.id,
                  courseImageUrl: course.courseImage,
                  lesson: lesson,
                ),
              );
              if (lesson.quiz != null) {
                drawerItems.add(
                  QuizDrawerTile(
                    key: ValueKey('quiz_${lesson.id}'),
                    courseId: course.id,
                    lesson: lesson,
                  ),
                );
              }
            }

            return CourseDrawer(drawerItems: drawerItems);
          },
        ),
        body: body,
      ),
    );
  }
}
