import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';
import '../../app_state/app_state_notifier.dart';

class AppRouterGuard {
  static String? handle(
    final BuildContext context,
    final GoRouterState state,
    final AppStateNotifier appState,
  ) {
    final String location = state.matchedLocation;

    // 1. Critical Priority: Initialization
    if (!appState.isInitialized) return AppRoutes.splash;

    // 2. State-Based Redirection
    if (!appState.isOnboarded) {
      return _handleOnboardingFlow(location);
    }

    if (!appState.isLoggedIn) {
      return _handleUnauthenticatedFlow(location);
    }

    return _handleAuthenticatedFlow(location);
  }



  static String? _handleOnboardingFlow(final String location) {
    if (location == AppRoutes.onBoarding) return null;
    return AppRoutes.onBoarding;
  }

  static String? _handleUnauthenticatedFlow(final String location) {
    final List<String> authRoutes = <String>[
      AppRoutes.login,
      AppRoutes.signUp,
      AppRoutes.forgotPassword,
      AppRoutes.newPassword,
      AppRoutes.verification,
    ];

    if (authRoutes.contains(location)) return null;
    return AppRoutes.login;
  }

  static String? _handleAuthenticatedFlow(final String location) {
    final List<String> restricted = <String>[
      AppRoutes.login,
      AppRoutes.onBoarding,
      AppRoutes.splash,
    ];

    if (restricted.contains(location)) return AppRoutes.home;

    return null;
  }
}
