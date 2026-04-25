import 'package:flutter/material.dart';
import 'package:skill_bit/core/utils/features/profile/achievements/achievement_dialog.dart';
import 'package:skill_bit/core/utils/global/assets.dart';
import '../../../../../domain/enums/trophy_status.dart';
import 'hexagon_clipper.dart';

class AchievementWidget extends StatelessWidget {
  const AchievementWidget({
    super.key,
    required this.url,
    required this.title,
    required this.status,
    required this.description,
    this.isLocked = true,
  });

  final String url;
  final String title;
  final TrophyStatus status;
  final String description;
  final bool? isLocked;

  @override
  Widget build(final BuildContext context) {
    final bool isGold = status == TrophyStatus.gold;

    return GestureDetector(
      onTap: () {
        AchievementDialog.achievementDetails(
          title: title,
          description: description,
          context: context,
          url: Assets.icon(url),
          heroTag: title,
          isLocked: isLocked!,
        );
      },
      child: AspectRatio(
        aspectRatio: 0.4,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: ClipPath(
                clipper: HexagonClipper(),
                child: isLocked!
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            Assets.icon('locked_trophy_icon.png'),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isGold
                                ? <Color>[
                                    const Color(0xFFF7EF8A),
                                    const Color(0xFFF5BC21),
                                    const Color(0xFFF7EF8A),
                                    const Color(0xFFF5BC21),
                                    const Color(0xFFF7EF8A),
                                    const Color(0xFFE4AA09),
                                  ]
                                : <Color>[
                                    const Color(0xFFFCFCFC),
                                    const Color(0xFF626367),
                                    const Color(0xFFFCFCFC),
                                    const Color(0xFF626367),
                                    const Color(0xFFFCFCFC),
                                    const Color(0xFF626367),
                                  ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: isGold
                                ? Image.asset(Assets.icon(url))
                                : Image.asset(Assets.icon(url)),
                          ),
                        ),
                      ),
              ),
            ),
            Positioned.fill(
              child: Image.asset(
                isGold
                    ? Assets.icon('gold_corner.png')
                    : Assets.icon('metal_corner.png'),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
