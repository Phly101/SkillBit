import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/features_index.dart';
import '../../features/onboarding/presentation/Bloc/onboarding_bloc.dart';
import '../app_state/app_state_notifier.dart';
import 'routes.dart';

class AppRouter {
  AppRouter({required this.appStateNotifier, required this.onboardingBloc});

  final AppStateNotifier appStateNotifier;
  final OnboardingBloc onboardingBloc;

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: appStateNotifier,
    redirect: (final BuildContext context, final GoRouterState state) {
      final bool isInitialized = appStateNotifier.isInitialized;
      final bool isOnboarded = appStateNotifier.isOnboarded;
      final bool isLoggedIn = appStateNotifier.isLoggedIn;
      final String location = state.matchedLocation;
      final bool goingToSplash = location == AppRoutes.splash;
      final bool goingToOnboarding = location == AppRoutes.onBoarding;
      final bool goingToLogin = location == AppRoutes.login;

      // ➣ ➣ ➣ Wait for initialization
      if (!isInitialized) {
        return AppRoutes.splash;
      }

      // ➣ ➣ ➣ If initialized and still on splash → decide where to go
      if (goingToSplash) {
        if (!isOnboarded) return AppRoutes.onBoarding;
        if (!isLoggedIn) return AppRoutes.login;
        return AppRoutes.home;
      }

      // ➣ ➣ ➣ Force onboarding if not completed
      if (!isOnboarded && !goingToOnboarding) {
        return AppRoutes.onBoarding;
      }

      // This Defines which routes are part of the Auth Flow
      final bool goingToAuthFlow =
          location == AppRoutes.login ||
          location == AppRoutes.signUp ||
          location == AppRoutes.forgotPassword ||
          location == AppRoutes.newPassword ||
          location == AppRoutes.verification;

      // ➣ ➣ ➣ Force login  if they aren't already in the auth flow
      if (isOnboarded && !isLoggedIn && !goingToAuthFlow) {
        return AppRoutes.home;
      }

      // ➣ ➣ ➣ Prevent logged-in users from going back to login/onboarding
      if (isLoggedIn && (goingToLogin || goingToOnboarding)) {
        return AppRoutes.home;
      }

      return null;
    },
    // routes ➣ ➣ ➣
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (final BuildContext context, final GoRouterState state) =>
            const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (final BuildContext context, final GoRouterState state) =>
            const LogInPage(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (final BuildContext context, final GoRouterState state) =>
            const SignUpPage(),
      ),
      GoRoute(
        path: AppRoutes.verification,
        builder: (final BuildContext context, final GoRouterState state) =>
            const VerificationPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (final BuildContext context, final GoRouterState state) =>
            const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.newPassword,
        builder: (final BuildContext context, final GoRouterState state) =>
            const NewPasswordPage(),
      ),
      GoRoute(
        path: AppRoutes.assessment,
        builder: (final BuildContext context, final GoRouterState state) =>
            const AssessmentTransitionPage(),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (final BuildContext context, final GoRouterState state) =>
            const NotificationPage(),
      ),

      GoRoute(
        path: AppRoutes.onBoarding,
        builder: (final BuildContext context, final GoRouterState state) =>
            BlocProvider<OnboardingBloc>.value(
              value: onboardingBloc,
              child: const OnboardingPage(),
            ),
      ),
      StatefulShellRoute.indexedStack(
        builder:
            (
              final BuildContext context,
              final GoRouterState state,
              final StatefulNavigationShell navigationShell,
            ) {
              return MainNavigationPage(navigationShell: navigationShell);
            },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              // home page
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
                path: AppRoutes.contest,
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        const ContestDetailsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              // profile page
              GoRoute(
                path: AppRoutes.profile,
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        const ProfilePage(),
                routes: <RouteBase>[
                  // badges page
                  GoRoute(
                    name: AppRoutes.badges,
                    path: AppRoutes.badges,
                    builder:
                        (
                          final BuildContext context,
                          final GoRouterState state,
                        ) => const BadgesPage(),
                  ),
                  // achievement page
                  GoRoute(
                    name: AppRoutes.achievement,
                    path: AppRoutes.achievement,
                    builder:
                        (
                          final BuildContext context,
                          final GoRouterState state,
                        ) => const AchievementsPage(),
                  ),
                  // about us page
                  GoRoute(
                    name: AppRoutes.aboutUs,
                    path: AppRoutes.aboutUs,
                    builder:
                        (
                          final BuildContext context,
                          final GoRouterState state,
                        ) => const AboutUsPage(),
                  ),
                  // contact us page
                  GoRoute(
                    name: AppRoutes.contactUs,
                    path: AppRoutes.contactUs,
                    builder:
                        (
                          final BuildContext context,
                          final GoRouterState state,
                        ) => const ContactUsPage(),
                  ),
                  // settings page
                  GoRoute(
                    name: AppRoutes.settings,
                    path: AppRoutes.settings,
                    builder:
                        (
                          final BuildContext context,
                          final GoRouterState state,
                        ) => const SettingsPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
