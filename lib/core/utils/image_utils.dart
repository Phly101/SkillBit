import 'dart:ui';

import 'package:flutter/material.dart';

class ImageUtils {
  ImageUtils._();

  static void showHeroPreview({
    required final BuildContext context,
    required final String heroTag,
    required final String profileUrl,
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
                child: Center(
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: anim1,
                      curve: Curves.fastOutSlowIn,
                    ),
                    child: Hero(
                      tag: heroTag,
                      child: InteractiveViewer(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage(profileUrl),
                              fit: BoxFit.cover,
                            ),
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
