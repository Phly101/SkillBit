import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';

import '../../../../../../../core/router/routes.dart';
import '../../../../../../../core/widgets/global/back_button.dart';

class CourseIntroWidget extends StatelessWidget {
  const CourseIntroWidget({super.key, required this.course});

  final CourseDetailsEntity course;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Hero image with back button overlaid
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
                child: CachedNetworkImage(
                  imageUrl: course.courseImage,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.fill,
                  placeholder: (final BuildContext context, final String url) =>
                      Container(
                        height: 300,
                        color: context.colorScheme.onSurface,
                      ),
                  errorWidget:
                      (
                        final BuildContext context,
                        final String url,
                        final Object error,
                      ) => Container(
                        height: 300,
                        color: context.colorScheme.onSurface,
                        child: const Icon(Icons.image_not_supported, size: 50),
                      ),
                ),
              ),
              // Gradient overlay for readability
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black.withValues(alpha: 0.35),
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.5),
                      ],
                    ),
                  ),
                ),
              ),
              // Title bottom left over image
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Text(
                  course.title,
                  style: context.textTheme.displayLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 8,
                        color: Colors.black.withValues(alpha: 0.4),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 16,
                child: ArrowBackButton(
                  color: context.colorScheme.surface,
                  function: () => context.go(AppRoutes.home),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Status chip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    course.type.name.toUpperCase(),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Description
                Text(
                  course.description,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),

                const SizedBox(height: 32),

                // Divider
                Divider(color: context.colorScheme.outlineVariant),

                const SizedBox(height: 24),

                // Lessons section header
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.menu_book_rounded,
                      color: context.colorScheme.primary,
                      size: 22,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Course lessons',
                      style: context.textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  'Open the drawer to browse all lessons and track your progress.',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 28),

                ElevatedButton.icon(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Start lessons'),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
