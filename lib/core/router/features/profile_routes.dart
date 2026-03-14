import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../features/features_index.dart'
    show
        AboutUsPage,
        AchievementsPage,
        BadgesPage,
        ContactUsPage,
        FriendsPage,
        SettingsPage;
import '../routes.dart';

class ProfileRoutes {
  static List<RouteBase> get profileRoutes => <RouteBase>[
    // badges page
    GoRoute(
      name: AppRoutes.badges,
      path: AppRoutes.badges,
      builder: (final BuildContext context, final GoRouterState state) =>
          const BadgesPage(),
    ),
    // achievement page
    GoRoute(
      name: AppRoutes.achievement,
      path: AppRoutes.achievement,
      builder: (final BuildContext context, final GoRouterState state) =>
          const AchievementsPage(),
    ),
    // friends page
    GoRoute(
      name: AppRoutes.friends,
      path: AppRoutes.friends,
      builder: (final BuildContext context, final GoRouterState state) =>
          const FriendsPage(),
    ),
    // about us page
    GoRoute(
      name: AppRoutes.aboutUs,
      path: AppRoutes.aboutUs,
      builder: (final BuildContext context, final GoRouterState state) =>
          const AboutUsPage(),
    ),
    // contact us page
    GoRoute(
      name: AppRoutes.contactUs,
      path: AppRoutes.contactUs,
      builder: (final BuildContext context, final GoRouterState state) =>
          const ContactUsPage(),
    ),
    // settings page
    GoRoute(
      name: AppRoutes.settings,
      path: AppRoutes.settings,
      builder: (final BuildContext context, final GoRouterState state) =>
          const SettingsPage(),
    ),
  ];
}
