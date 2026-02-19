import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/features/auth/presentation/pages/sign_up_page.dart';
import 'package:skill_bit/features/home/presentation/pages/home_page.dart';
import 'package:skill_bit/features/onboarding/presentation/Bloc/onboarding_bloc.dart';
import 'package:skill_bit/features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/log_in_page.dart';
import '../../features/onboarding/presentation/Bloc/onboarding_notifier.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../constants/routes.dart';
import '../di/injection_container.dart';

class AppRouter {
  AppRouter({
    required this.isLoggedIn,
    required this.hasOnBoarded,
    required this.onboardingBloc,
    required this.onboardingNotifier,
  });

  final bool Function() isLoggedIn;
  final bool Function() hasOnBoarded;
  final OnboardingBloc onboardingBloc;
  final OnboardingNotifier onboardingNotifier;

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: onboardingNotifier,

    redirect: (final BuildContext context, final GoRouterState state) {
      final bool onBoarded = onboardingNotifier.onboarded || hasOnBoarded();
      final bool loggedIn = isLoggedIn();
      print('DEBUG: Redirect running. Onboarded: $onBoarded, Path: ${state.matchedLocation}');
      final bool goingToSplash = state.matchedLocation == AppRoutes.splash;
      final bool goingToOnboarding =
          state.matchedLocation == AppRoutes.onBoarding;
      final bool goingToLogin = state.matchedLocation == AppRoutes.login;

      if (goingToSplash) {
        return null;
      }
      // first Launch ➣ onBoarding
      else if (!onBoarded && !goingToOnboarding) {
        return AppRoutes.onBoarding;
      }
      // finished onBoarding ➣ log In
      if (onBoarded && !loggedIn && !goingToLogin) {
        print('DEBUG: Should be leaving onboarding now!');
        return AppRoutes.login;
      }

      // logged in ➣➣ home
      if (loggedIn && (goingToLogin || goingToOnboarding)) {
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
        path: AppRoutes.onBoarding,
        builder: (final BuildContext context, final GoRouterState state) =>
        BlocProvider<OnboardingBloc>.value(
          value: onboardingBloc,
          child: const OnboardingPage(),
        ),
      ),

      GoRoute(
        path: AppRoutes.home,
        builder: (final BuildContext context, final GoRouterState state) =>
            const HomePage(),
      ),
    ],
  );
}
