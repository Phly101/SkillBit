import 'dart:ui';
import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {
  PathPainter({
    required this.index,
    required this.isNextLocked,
    this.animationProgress = 1.0,
  });

  final int index;
  final bool isNextLocked;
  final double animationProgress;

  @override
  void paint(final Canvas canvas, final Size size) {
    final Path fullPath = _buildPath(size);
    if (isNextLocked) {
      _drawLockedPath(canvas, fullPath);
    } else {
      // Create a partial path based on the animation progress
      final Path animatedPath = Path();
      for (PathMetric metric in fullPath.computeMetrics()) {
        animatedPath.addPath(
          metric.extractPath(0, metric.length * animationProgress),
          Offset.zero,
        );
      }
      _drawUnlockedPath(canvas, animatedPath);
    }
  }

  Path _buildPath(final Size size) {
    final Path path = Path();
    final bool isEven = index % 2 == 0;

    if (isEven) {
      path.moveTo(size.width * 0.25, 0);
      path.quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.5,
        size.width * 0.75,
        size.height,
      );
    } else {
      path.moveTo(size.width * 0.75, 0);
      path.quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.5,
        size.width * 0.25,
        size.height,
      );
    }
    return path;
  }

  void _drawUnlockedPath(final Canvas canvas, final Path path) {
    // 1. Draw Shadow/Depth for 3D effect
    final Paint shadowPaint = Paint()
      ..color = Colors.orange.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path.shift(const Offset(0, 4)), shadowPaint);

    // 2. Draw outer glow
    final Paint glowPaint = Paint()
      ..color = Colors.amber.withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3.0);

    canvas.drawPath(path, glowPaint);

    // 3. Draw main golden line
    final Paint mainPaint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, mainPaint);
  }

  void _drawLockedPath(final Canvas canvas, final Path path) {
    // Use a dashed effect for locked paths
    final Paint dashedPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    // Manual dashing logic: extract path metrics to draw segments
    for (PathMetric measure in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < measure.length) {
        final Path extract = measure.extractPath(distance, distance + 10);
        canvas.drawPath(extract, dashedPaint);
        distance += 20; // gap size
      }
    }
  }

  @override
  bool shouldRepaint(covariant final PathPainter oldDelegate) =>
      oldDelegate.animationProgress != animationProgress ||
          oldDelegate.isNextLocked != isNextLocked;
}