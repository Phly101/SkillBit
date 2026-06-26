import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/utils/global/box_state_switcher.dart';
import 'package:skill_bit/core/widgets/course/course_intro_skeleton.dart';
import 'package:skill_bit/core/widgets/global/back_button.dart';
import 'package:skill_bit/core/widgets/global/error/error_state_widget.dart';
import 'package:skill_bit/core/widgets/onboarding/transition_screen_widget.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import '../../../../../../core/constants/course_constants.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/global/assets.dart';
import '../../../Bloc/courseDetails/course_details_bloc.dart';
import '../widgets/components/course_intro_widget.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key, this.isEnrolledFromHome});

  final bool? isEnrolledFromHome;

  @override
  Widget build(final BuildContext context) {
    final String? courseId = GoRouterState.of(
      context,
    ).pathParameters['courseId'];

    return BoxStateSwitcher<CourseDetailsBloc, CourseDetailsState>(
      key: ValueKey('course_page_$courseId'),
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
      loadingWidget: const CourseIntroSkeleton(),
      onSuccess: (final BuildContext context, final CourseDetailsState state) {
        final CourseDetailSuccess successState = state as CourseDetailSuccess;
        final CourseDetailsEntity course = successState.course;
        final bool isEnrolled =
            course.isEnrolled ?? isEnrolledFromHome ?? false;
        debugPrint('Course ID: ${course.id}, isEnrolled: $isEnrolled');

        return Stack(
          children: <Widget>[
            if (!isEnrolled) ...<Widget>[
              Positioned(
                top: 20,
                left: 16,
                child: ArrowBackButton(
                  color: context.colorScheme.onSurface,
                  function: () => context.go(AppRoutes.home),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: TransitionScreenWidget(
                  assetUrl: Assets.animation('Online_Learning.json'),
                  screenTitle: CourseConstants.title,
                  description: CourseConstants.description,
                  buttonText: CourseConstants.buttonText,
                  function: () {
                    context.read<CourseDetailsBloc>().add(
                      EnrollCourseEvent(courseId: course.id),
                    );
                  },
                ),
              ),
            ] else
              CourseIntroWidget(course: course),
          ],
        );
      },
    );
  }
}
