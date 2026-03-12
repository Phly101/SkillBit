import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/app_colors.dart';

class LockedCard extends StatelessWidget {
  const LockedCard({super.key});

  static const double _size = 127;
  static const double _iconSize = 100;

  @override
  Widget build(final BuildContext context) {
    return const SizedBox(
      width: _size,
      height: _size,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _BackgroundCircle(),
          _ShieldIcon(),
          _GradientOverlay(),
        ],
      ),
    );
  }
}

class _BackgroundCircle extends StatelessWidget {
  const _BackgroundCircle();

  @override
  Widget build(final BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.textMain.withValues(alpha: 0.75),
      ),
    );
  }
}

class _ShieldIcon extends StatelessWidget {
  const _ShieldIcon();

  @override
  Widget build(final BuildContext context) {
    return Icon(
      Icons.shield,
      size: LockedCard._iconSize,
      color: AppColors.textMain.withValues(alpha: .25),
    );
  }
}

class _GradientOverlay extends StatelessWidget {
  const _GradientOverlay();

  @override
  Widget build(final BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const <double>[0.5, 0.95],
            colors: <Color>[
              Colors.transparent,
              AppColors.surface.withValues(alpha: 0.9),
            ],
          ),
        ),
      ),
    );
  }
}
