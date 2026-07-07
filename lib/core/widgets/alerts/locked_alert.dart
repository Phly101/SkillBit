import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/assets.dart';
import 'package:skill_bit/core/widgets/global/button_widget.dart';

class LockedAlert extends StatelessWidget {
  const LockedAlert({super.key});

  @override
  Widget build(final BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Lottie.asset(
              Assets.animation('lock_animation.json'),
              height: 200,
              repeat: false,
            ),
            const SizedBox(height: 10),
            Text(
              'Course Locked!',
              style: context.textTheme.displayLarge?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'You need to complete the previous courses in this level to unlock this one.',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(height: 25),
            ButtonWidget(
              color: context.colorScheme.onError,
              function: () => Navigator.pop(context),
              child:  Text(
                'Understood',
                style: context.textTheme.titleMedium!.copyWith(color: context.colorScheme.surface

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
