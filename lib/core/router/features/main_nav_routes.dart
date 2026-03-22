import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/features/profile_routes.dart';
import '../../../features/features_index.dart'
    show
        HomePage,
        MainNavigationPage,
        AgendaPage,
        ContestDetailsPage,
        ProfilePage;
import '../routes.dart';

class MainNavRoutes {
  static StatefulShellRoute mainRoutes() {
    return StatefulShellRoute.indexedStack(
      builder:
          (
            final BuildContext context,
            final GoRouterState state,
            final StatefulNavigationShell navigationShell,
          ) {
            return MainNavigationPage(navigationShell: navigationShell);
          },
      branches: <StatefulShellBranch>[
        // Branch 1: Home
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.home,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            // agenda page
            GoRoute(
              path: AppRoutes.agenda,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const AgendaPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            // contest page
            GoRoute(
              path: AppRoutes.contestDetails,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const ContestDetailsPage(),
            ),
          ],
        ),
        // Branch 3: Profile
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.profile,
              builder:
                  (final BuildContext context, final GoRouterState state) =>
                      const ProfilePage(),
              routes: ProfileRoutes.profileRoutes,
            ),
          ],
        ),
      ],
    );
  }
}
