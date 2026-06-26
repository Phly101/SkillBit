import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../features/contests/presentation/Bloc/contest_bloc.dart';
import '../../../features/features_index.dart'
    show ContestPage, ResultsPage, LeaderboardPage, ContestReviewPage;
import '../../di/injection_container.dart';
import '../../entities/results_details_entity.dart';
import '../routes.dart';

class ContestRoutes {
  static List<RouteBase> get contestRoutes => <RouteBase>[
    GoRoute(
      path: AppRoutes.contestPage,
      name: 'contest_page',
      builder: (final BuildContext context, final GoRouterState state) {
        final String contestId = state.extra as String;
        return ContestPage(contestId: contestId);
      },
    ),
    GoRoute(
      path: AppRoutes.resultsPage,
      name: AppRoutes.resultsPage,
      builder: (final BuildContext context, final GoRouterState state) {
        final ResultsDetails results = (state.extra is ResultsDetails)
            ? state.extra as ResultsDetails
            : ResultsDetails(
                wrongAnswers: 0,
                correctAnswers: 0,
                totalQuestions: 1,
                quizScore: 0,
              );

        final num total = results.totalQuestions > 0
            ? results.totalQuestions
            : 1;
        final String? contestId = state.uri.queryParameters['contestId'];

        return ResultsPage(
          isContest: true,
          pageTitle: 'Contest Results',
          correctScorePercentage: (results.correctAnswers / total) * 100,
          inCorrectScorePercentage: (results.wrongAnswers / total) * 100,
          totalQuestions: results.totalQuestions,
          wrongAnswers: results.wrongAnswers,
          rightAnswers: results.correctAnswers,
          reviewFunction: () {
            if (contestId != null) {
              context.pushNamed(
                'contest_review',
                pathParameters: <String, String>{'contestId': contestId},
              );
            }
          },
          showLeaderBoardFunction: () {
            // Using pushNamed without extra, relying on Singleton
            context.pushNamed(
              'contest_leaderboards',
              pathParameters: <String, String>{'contestId': contestId ?? ''},
            );
          },
        );
      },
    ),
    GoRoute(
      path: '${AppRoutes.contestReview}/:contestId',
      name: 'contest_review',
      builder: (final BuildContext context, final GoRouterState state) =>
          BlocProvider<ContestBloc>.value(
            value: sl<ContestBloc>(),
            child: ContestReviewPage(
              contestId: state.pathParameters['contestId'] ?? '',
            ),
          ),
    ),
    GoRoute(
      path: '${AppRoutes.contestLeaderboards}/:contestId',
      name: 'contest_leaderboards',
      builder: (final BuildContext context, final GoRouterState state) =>
          BlocProvider<ContestBloc>.value(
            value: sl<ContestBloc>(),
            child: LeaderboardPage(
              contestId: state.pathParameters['contestId'],
            ),
          ),
    ),
  ];
}
