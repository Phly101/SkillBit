import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

import '../../../global/assets.dart';

class AchievementDialog {
  AchievementDialog._();

  static void achievementDetails({
    required final String description,
    required final BuildContext context,
    required final String url,
    required final String heroTag,
    required final String title,
    required final bool isLocked,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withValues(alpha: 0.75),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder:
          (
            final BuildContext context,
            final Animation<double> anim1,
            final Animation<double> anim2,
          ) {
            return GestureDetector(
              onTap: () => Navigator.pop(context),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Material(
                  color: Colors.transparent,
                  child: Center(
                    child: ScaleTransition(
                      scale: CurvedAnimation(
                        parent: anim1,
                        curve: Curves.fastOutSlowIn,
                      ),
                      child: Hero(
                        tag: heroTag,
                        child: InteractiveViewer(
                          clipBehavior: Clip.none,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                          //  height: MediaQuery.of(context).size.height * 0.65,
                            decoration: BoxDecoration(
                              color: context.colorScheme.surface,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                isLocked
                                    ? Image.asset(
                                        Assets.icon('locked_trophy_icon.png'),
                                        scale: 3.5,
                                        fit: .contain
                                      )
                                    : Image.asset(url, fit: .fill),
                                const SizedBox(height: 10),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    title,
                                    style: context.textTheme.displayLarge,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    description,
                                    textAlign: .center,
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ),
                              ],
                            ).pNum(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
    );
  }
}
