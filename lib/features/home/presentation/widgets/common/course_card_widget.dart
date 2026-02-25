import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:water_animation/water_animation.dart';

class CourseCardWidget extends StatelessWidget {
  const CourseCardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.progress,
  });

  final String title;
  final String imageUrl;
  final double progress;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 200,
      width: 220,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned.fill(
              child: progress < 1.0
                  ? WaterAnimation(
                      waterFillFraction: progress,
                      fillTransitionDuration: const Duration(
                        milliseconds: 600,
                      ),
                      amplitude: 8,
                      frequency: 1,
                      speed: 1,
                      gradientColors: <Color>[
                        context.colorScheme.primary,
                        context.colorScheme.secondary,
                      ],
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            context.colorScheme.primary.withValues(alpha: 0.9),
                            context.colorScheme.secondary.withValues(alpha: 0.9),
                          ],
                        ),
                      ),
                    ),
            ),


            RepaintBoundary(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: .min,
                  children: <Widget>[
                    Expanded(child: Image.asset(imageUrl, fit: BoxFit.contain)),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: progress >= 1.0 ? Colors.white : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
