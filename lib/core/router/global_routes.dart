import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/router/routes.dart';

import '../../features/features_index.dart'
    show
        AssessmentTransitionPage,
        ForgotPasswordPage,
        LogInPage,
        NewPasswordPage,
        NotificationPage,
        OnboardingPage,
        SignUpPage,
        SplashPage,
        VerificationPage;
import '../../features/onboarding/presentation/Bloc/onboarding_bloc.dart';

class GlobalRoutes {
  // Routes accessible before/during authentication
  static List<RouteBase> authRoutes(
    final OnboardingBloc onboardingBloc,
  ) => <RouteBase>[
    GoRoute(
      path: AppRoutes.splash,
      builder: (final BuildContext context, final GoRouterState state) =>
          const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.onBoarding,
      builder: (final BuildContext context, final GoRouterState state) =>
          BlocProvider<OnboardingBloc>.value(
            value: onboardingBloc,
            child: const OnboardingPage(),
          ),
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
      builder: (final BuildContext context, final GoRouterState state) {
        final Map<String, dynamic> extra =
            state.extra as Map<String, dynamic>? ?? <String, dynamic>{};
        final String email = extra['email'] as String? ?? '';
        final bool isResetPassword = extra['isReset'] as bool? ?? false;
        return VerificationPage(email: email, isResetPassword: isResetPassword);
      },
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (final BuildContext context, final GoRouterState state) =>
          const ForgotPasswordPage(),
    ),
    GoRoute(
      path: AppRoutes.newPassword,
      builder: (final BuildContext context, final GoRouterState state) {
        final Map<String, dynamic> extra =
            state.extra as Map<String, dynamic>? ?? <String, dynamic>{};
        final String email = extra['email'] as String? ?? '';
        final String code = extra['code'] as String? ?? '';
        return NewPasswordPage(email: email, code: code);
      },
    ),
  ];

  // Global utility routes
  static List<RouteBase> utilityRoutes() => <RouteBase>[
    GoRoute(
      path: AppRoutes.notifications,
      builder: (final BuildContext context, final GoRouterState state) =>
          const NotificationPage(),
    ),
    GoRoute(
      path: AppRoutes.assessment,
      builder: (final BuildContext context, final GoRouterState state) =>
          const AssessmentTransitionPage(),
    ),
  ];
}
