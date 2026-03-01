import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/features/assessment/presentation/pages/assessment_transition_page.dart';
import 'package:skill_bit/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:skill_bit/features/auth/presentation/pages/new_password_page.dart';
import 'package:skill_bit/features/auth/presentation/pages/sign_up_page.dart';
import 'package:skill_bit/features/auth/presentation/pages/verification_page.dart';
import 'package:skill_bit/features/contest/presentation/pages/contest_page.dart';
import 'package:skill_bit/features/home/presentation/pages/home_page.dart';
import 'package:skill_bit/features/notifications/presentation/pages/notification_page.dart';
import 'package:skill_bit/features/onboarding/presentation/Bloc/onboarding_bloc.dart';
import 'package:skill_bit/features/profile/presentation/pages/about_us_page.dart';
import 'package:skill_bit/features/profile/presentation/pages/contact_us_page.dart';
import 'package:skill_bit/features/splash/presentation/pages/splash_page.dart';
import '../../features/agenda/presentation/pages/agenda_page.dart';
import '../../features/auth/presentation/pages/log_in_page.dart';
import '../../features/home/presentation/pages/main_navigation_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/profile/presentation/pages/achievements_page.dart';
import '../../features/profile/presentation/pages/badges_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
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
              GoRoute(
                path: AppRoutes.contest,
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        const ContestPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.profile,
                builder:
                    (final BuildContext context, final GoRouterState state) =>
                        const ProfilePage(),
                routes: <RouteBase>[
                  // badges page
                  GoRoute(
                    path: AppRoutes.badges,
                    builder:
                        (
                          final BuildContext context,
                          final GoRouterState state,
                        ) => const BadgesPage(),
                  ),
                  // achievement page
                  GoRoute(
                    path: AppRoutes.achievement,
                    builder:
                        (
                          final BuildContext context,
                          final GoRouterState state,
                        ) => const AchievementsPage(),
                  ),
                  // about us page
                  GoRoute(
                    path: AppRoutes.aboutUs,
                    builder:
                        (
                          final BuildContext context,
                          final GoRouterState state,
                        ) => const AboutUsPage(),
                  ),
                  // contact us page
                  GoRoute(
                    path: AppRoutes.contactUs,
                    builder:
                        (
                          final BuildContext context,
                          final GoRouterState state,
                        ) => const ContactUsPage(),
                  ),
                  // settings page
                  GoRoute(
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
