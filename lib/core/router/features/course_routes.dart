import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';

import '../../../features/features_index.dart'
    show
        CoursePage,
        LessonPage,
        MainCourseNavigationPage,
        QuizPage,
        QuizDetailsPage,
        ResultsPage,
        QuizReviewPage;
import '../../../features/quiz/presentation/Bloc/quiz_bloc.dart';
import '../../di/injection_container.dart';
import '../../entities/results_details_entity.dart';

class CourseRoutes {
  static RouteBase get courseBranchRoutes => ShellRoute(
    builder:
        (
          final BuildContext context,
          final GoRouterState state,
          final Widget child,
        ) {
          final String? courseId = state.pathParameters['courseId'];
          return MainCourseNavigationPage(
            key: ValueKey('course_shell_$courseId'),
            body: child,
            courseId: courseId,
          );
        },
    routes: <RouteBase>[
      GoRoute(
        path: '${AppRoutes.course}/:courseId',
        name: 'course_details',
        builder: (final BuildContext context, final GoRouterState state) =>
            CoursePage(
              isEnrolledFromHome:
                  state.uri.queryParameters['isEnrolled'] == 'true',
            ),
        routes: <RouteBase>[
          GoRoute(
            path: 'lesson/:lessonId',
            name: 'lesson_page',
            builder: (final BuildContext context, final GoRouterState state) =>
                LessonPage(
                  courseId: state.pathParameters['courseId'],
                  lessonId: state.pathParameters['lessonId'],
                  courseImageUrl: state.uri.queryParameters['imageUrl'],
                ),
          ),
          ShellRoute(
            builder:
                (
                  final BuildContext context,
                  final GoRouterState state,
                  final Widget child,
                ) {
                  return BlocProvider<QuizBloc>(
                    create: (final BuildContext context) => sl<QuizBloc>(),
                    child: child,
                  );
                },
            routes: <RouteBase>[
              GoRoute(
                path: 'lesson/:lessonId/quiz/:quizId/details',
                name: 'quiz_details',
                builder:
                    (
                      final BuildContext context,
                      final GoRouterState state,
                    ) => QuizDetailsPage(
                      courseId: state.pathParameters['courseId'] ?? '',
                      lessonId: state.pathParameters['lessonId'] ?? '',
                      quizId: state.pathParameters['quizId'] ?? '',
                      title: state.uri.queryParameters['title'] ?? '',
                      difficulty: state.uri.queryParameters['difficulty'] ?? '',
                      time:
                          int.tryParse(
                            state.uri.queryParameters['time'] ?? '0',
                          ) ??
                          0,
                      passingScore:
                          int.tryParse(
                            state.uri.queryParameters['passingScore'] ?? '0',
                          ) ??
                          0,
                    ),
              ),
              GoRoute(
                path: 'lesson/:lessonId/quiz/:quizId',
                name: 'quiz_page',
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        QuizPage(
                          courseId: state.pathParameters['courseId'],
                          lessonId: state.pathParameters['lessonId'],
                          quizId: state.pathParameters['quizId'],
                        ),
              ),
              GoRoute(
                path: 'lesson/:lessonId/quiz/:quizId/results',
                name: 'quiz_results',
                builder:
                    (final BuildContext context, final GoRouterState state) {
                      final ResultsDetails results =
                          state.extra as ResultsDetails;
                      final String? courseId = state.pathParameters['courseId'];
                      final String? lessonId = state.pathParameters['lessonId'];
                      final String? quizId = state.pathParameters['quizId'];

                      final num total = results.totalQuestions > 0
                          ? results.totalQuestions
                          : 1;

                      return ResultsPage(
                        isContest: false,
                        pageTitle: 'Quiz Results',
                        correctScorePercentage:
                            (results.correctAnswers / total) * 100,
                        inCorrectScorePercentage:
                            (results.wrongAnswers / total) * 100,
                        totalQuestions: results.totalQuestions,
                        wrongAnswers: results.wrongAnswers,
                        rightAnswers: results.correctAnswers,
                        reviewFunction: () {
                          context.pushNamed(
                            'quiz_review',
                            pathParameters: <String, String>{
                              'courseId': courseId ?? '',
                              'lessonId': lessonId ?? '',
                              'quizId': quizId ?? '',
                            },
                          );
                        },
                        showLeaderBoardFunction: () {},
                      );
                    },
              ),
              GoRoute(
                path: 'lesson/:lessonId/quiz/:quizId/review',
                name: 'quiz_review',
                builder:
                    (final BuildContext context, final GoRouterState state) {
                      return QuizReviewPage(
                        quizId: state.pathParameters['quizId'] ?? '',
                      );
                    },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
