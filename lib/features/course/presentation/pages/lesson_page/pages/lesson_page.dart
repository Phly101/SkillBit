import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/state_switcher.dart';
import 'package:skill_bit/core/widgets/global/error/error_state_widget.dart';
import 'package:skill_bit/features/course/domain/entities/lesson_entity.dart';
import 'package:skill_bit/features/course/domain/entities/resource_entity.dart';
import 'package:skill_bit/features/course/presentation/Bloc/lessonDetails/lesson_details_bloc.dart';
import 'package:skill_bit/features/course/presentation/pages/lesson_page/widgets/common/lesson_page_loading_state_widget.dart';
import 'package:skill_bit/features/course/presentation/pages/lesson_page/widgets/components/lesson_body.dart';
import 'package:skill_bit/features/course/presentation/pages/lesson_page/widgets/components/lesson_footer.dart';
import 'package:skill_bit/features/course/presentation/pages/lesson_page/widgets/components/lesson_header.dart';
import '../../../../../../core/di/injection_container.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key, required this.courseId, required this.lessonId});

  final String? courseId;
  final String? lessonId;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<LessonDetailsBloc>(
      create: (final BuildContext context) => sl<LessonDetailsBloc>()
        ..add(
          LoadLessonDetails(lessonId: lessonId ?? '', courseId: courseId ?? ''),
        ),
      child: BlocListener<LessonDetailsBloc, LessonDetailsState>(
        listenWhen:
            (
              final LessonDetailsState previous,
              final LessonDetailsState current,
            ) => current is LessonActionFailure,
        listener: (final BuildContext context, final LessonDetailsState state) {
          if (state is LessonActionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: context.colorScheme.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: StateSwitcher<LessonDetailsBloc, LessonDetailsState>(
          buildWhen:
              (
                final LessonDetailsState previous,
                final LessonDetailsState current,
              ) =>
                  current is LessonDetailsLoading ||
                  current is LessonDetailSuccess ||
                  current is LessonDetailsError,
          onInitial:
              (final BuildContext context, final LessonDetailsState state) =>
                  const Center(child: Text('init')),
          loadingWidget: const LessonPageLoadingStateWidget(),
          onSuccess:
              (final BuildContext context, final LessonDetailsState state) {
                final LessonDetailSuccess successState =
                    state as LessonDetailSuccess;
                final LessonEntity lesson = successState.lesson;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      // header
                      LessonHeader(title: lesson.title),
                      const SizedBox(height: 10),
                      // body
                      LessonBody(
                        imageUrl: lesson.imageUrl,
                        description: lesson.description,
                        courseId: courseId ?? '',
                      ),
                      const SizedBox(height: 10),
                      LessonFooter(
                        resourceList: lesson.resources ?? <ResourceEntity>[],
                        lessonId: lessonId ?? '',
                        courseId: courseId ?? '',
                      ),

                      // footer
                    ],
                  ).pH(10),
                );
              },
          onError:
              (
                final String message,
                final BuildContext context,
                final LessonDetailsState state,
              ) => ErrorStateWidget(
                message: message,
                routeFunction: () {
                  context.go(AppRoutes.home);
                },
              ),
        ),
      ),
    );
  }
}
