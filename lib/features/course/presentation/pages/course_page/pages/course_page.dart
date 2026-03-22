import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/utils/global/state_switcher.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';
import 'package:skill_bit/core/widgets/global/error/error_state_widget.dart';
import 'package:skill_bit/core/widgets/onboarding/transition_screen_widget.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import '../../../../../../core/constants/course_constants.dart';
import '../../../../../../core/utils/global/assets.dart';
import '../../../Bloc/courseDetails/course_details_bloc.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return StateSwitcher<CourseDetailsBloc, CourseDetailsState>(
      onInitial: (final BuildContext context, final CourseDetailsState state) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: MediaQuery.heightOf(context) * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
      onError:
          (
            final String message,
            final BuildContext context,
            final CourseDetailsState state,
          ) {
            final String? courseId = GoRouterState.of(
              context,
            ).pathParameters['courseId'];
            return ErrorStateWidget(
              message: message,
              reFreshFunction: () {
                context.read<CourseDetailsBloc>().add(
                  LoadCourseDetails(courseId: courseId ?? 'id'),
                );
              },
              routeFunction: () {
                context.go(AppRoutes.home);
              },
            );
          },
      loadingWidget: const Center(child: CircularProgressIndicator()),
      onSuccess: (final BuildContext context, final CourseDetailsState state) {
        final CourseDetailSuccess successState = state as CourseDetailSuccess;
        final CourseEntity course = successState.course;
        return Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: TransitionScreenWidget(
                assetUrl: Assets.animation('Online_Learning.json'),
                screenTitle: CourseConstants.title,
                description: CourseConstants.description,
                buttonText: CourseConstants.buttonText,
                function: //Todo: Implement Function logic
                () {
                  final String? firstLessonId = course.lessons?.first.id;
                  context.go(
                    '${AppRoutes.course}/${course.id}/lesson/$firstLessonId',
                  );
                },
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: ArrowBackButton(
                function: () => context.go(AppRoutes.home),
              ),
            ),
          ],
        );
      },
    );
  }
}
