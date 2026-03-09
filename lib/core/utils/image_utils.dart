import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class ImageUtils {
  ImageUtils._();

  static void showHeroPreview({
    required final BuildContext context,
    required final String heroTag,
    required final String profileUrl,
    final bool haveEditButton=false,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Hero(
                            tag: heroTag,
                            child: InteractiveViewer(
                              clipBehavior: Clip.none,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height:
                                    MediaQuery.of(context).size.width * 0.85,
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
                          if(haveEditButton)...<Widget>[
                            const SizedBox(height: 24),
                            ElevatedButton.icon(
                              onPressed: //Todo: Implement Function logic
                                  () {},
                              icon: const Icon(Icons.edit),
                              label: const Text('Choose from Gallery'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withValues(
                                  alpha: 0.9,
                                ),
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ).pH(10),
                          ]

                        ],
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
