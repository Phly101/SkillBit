import 'package:flutter/material.dart';

import '../../../../../core/utils/path_painter.dart';
class AnimatedPathItem extends StatefulWidget {

  const AnimatedPathItem({super.key, required this.index, required this.isNextLocked});
  final int index;
  final bool isNextLocked;

  @override
  State<AnimatedPathItem> createState() => _AnimatedPathItemState();
}

class _AnimatedPathItemState extends State<AnimatedPathItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500), // Speed of the line drawing
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Only animate if the path is being "unlocked"
    if (!widget.isNextLocked) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (final BuildContext context, final Widget? child) {
        return CustomPaint(
          size: const Size(double.infinity, 100),
          painter: PathPainter(
            index: widget.index,
            isNextLocked: widget.isNextLocked,
            animationProgress: _animation.value,
          ),
        );
      },
    );
  }
}

