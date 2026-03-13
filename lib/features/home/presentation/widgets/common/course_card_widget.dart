import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:water_animation/water_animation.dart';

class CourseCardWidget extends StatelessWidget {
  const CourseCardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.progress,
    required this.isLocked,
    this.isCompleted = false,
  });

  final String title;
  final String imageUrl;
  final double progress;
  final bool isLocked;
  final bool isCompleted;

  @override
  Widget build(final BuildContext context) {

    return isLocked
        // if locked
        ? InkWell(
            onTap: //Todo: Implement Function logic
                () {},
            child: AspectRatio(
              aspectRatio: 0.8,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.outline.withValues(alpha: 0.9),
                  borderRadius: .circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.matrix(<double>[
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ]),
                          child: Image.asset(imageUrl, fit: .contain),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: .centerLeft,
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        // if unlocked:
        : InkWell(
            onTap: //Todo: Implement Function logic
                () {},
            child: AspectRatio(
              aspectRatio: 0.8,
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
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    context.colorScheme.primary.withValues(
                                      alpha: 0.9,
                                    ),
                                    context.colorScheme.secondary.withValues(
                                      alpha: 0.9,
                                    ),
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
                            Expanded(
                              child: Image.asset(imageUrl, fit: BoxFit.contain),
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: .centerLeft,
                              child: Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.displayMedium!
                                    .copyWith(
                                      color: progress >= 1.0
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
