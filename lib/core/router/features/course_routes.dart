import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import '../../../features/features_index.dart'
    show CoursePage, LessonPage, MainCourseNavigationPage, QuizPage;


class CourseRoutes {
  static RouteBase get courseBranchRoutes => ShellRoute(
    builder:
        (
          final BuildContext context,
          final GoRouterState state,
          final Widget child,
        ) {
          final String? courseId = state.pathParameters['courseId'];
          return MainCourseNavigationPage(body: child, courseId: courseId);
        },
    routes: <RouteBase>[
      GoRoute(
        path: '${AppRoutes.course}/:courseId',
        builder: (final BuildContext context, final GoRouterState state) =>
            const CoursePage(),
        routes: <RouteBase>[

          GoRoute(
            path: 'lesson/:lessonId',
            builder: (final BuildContext context, final GoRouterState state) =>
                LessonPage(
                  courseId: state.pathParameters['courseId'],
                  lessonId: state.pathParameters['lessonId'],
                ),
          ),
          GoRoute(
            path: 'lesson/:lessonId/quiz/:quizId',
            builder: (final BuildContext context, final GoRouterState state) =>
                QuizPage(
                  courseId: state.pathParameters['courseId'],
                  lessonId: state.pathParameters['lessonId'],
                  quizId: state.pathParameters['quizId'],
                ),
          ),
        ],
      ),
    ],
  );
}
