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
          alignment: .centerLeft,
          children: <Widget>[
            progress < 1.0
                ? WaterAnimation(
                    height: 200,
                    width: 220,
                    waterFillFraction: progress,
                    fillTransitionDuration: const Duration(milliseconds: 3000),
                    fillTransitionCurve: Curves.easeInOutQuart,
                    amplitude: 10,
                    frequency: 1,
                    speed: 1,
                    gradientColors: <Color>[
                      context.colorScheme.primary,
                      context.colorScheme.secondary,
                    ],
                    enableRipple: true,
                    realisticWave: true,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                  )
                : Container(
                    height: 200,
                    width: 220,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          context.colorScheme.primary,
                          context.colorScheme.secondary,
                        ],
                      ),
                    ),
                  ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Expanded(child: Image.asset(imageUrl, fit: BoxFit.contain)),
                  const SizedBox(height: 12),

                  Align(
                    alignment: .topLeft,
                    child: Text(
                      title,
                      textAlign: .left,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 3.0,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
