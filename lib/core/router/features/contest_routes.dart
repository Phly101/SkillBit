import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/features_index.dart'
    show ContestPage, ContestResultPage, LeaderboardPage;
import '../routes.dart';

class ContestRoutes {
  static List<RouteBase> get contestRoutes => <RouteBase>[
    GoRoute(
      path: AppRoutes.contestPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const ContestPage(),
    ),
    GoRoute(
      path: AppRoutes.contestResults,
      builder: (final BuildContext context, final GoRouterState state) =>
          const ContestResultPage(),
    ),
    GoRoute(
      path: AppRoutes.contestLeaderboards,
      builder: (final BuildContext context, final GoRouterState state) =>
          const LeaderboardPage(),
    ),
  ];
}
