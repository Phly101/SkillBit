import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/onboarding/presentation/Bloc/onboarding_bloc.dart';
import '../app_state/app_state_notifier.dart';
import 'guard/app_router_guard.dart';
import 'features/contest_routes.dart';
import 'features/main_nav_routes.dart';
import 'global_routes.dart';
import 'routes.dart';

class AppRouter {
  AppRouter({required this.appStateNotifier, required this.onboardingBloc});

  final AppStateNotifier appStateNotifier;
  final OnboardingBloc onboardingBloc;

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: appStateNotifier,
    redirect: (final BuildContext context, final GoRouterState state) =>
        AppRouterGuard.handle(context, state, appStateNotifier),

    // routes ➣ ➣ ➣
    routes: <RouteBase>[
      // ➣ ➣ ➣ Spread Auth & Splash routes
      ...GlobalRoutes.authRoutes(onboardingBloc),

      // ➣ ➣ ➣ Spread Utility routes (Notifications, etc.)
      ...GlobalRoutes.utilityRoutes(),

      // ➣ ➣ ➣ Spread standalone Feature routes (Contests)
      ...ContestRoutes.contestRoutes,

      // ➣ ➣ ➣ The Main App Shell (Tabs)
      MainNavRoutes.mainRoutes(),
    ],
  );
}
