import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skill_bit/features/profile/domain/entities/achievement_entity.dart';
import 'package:skill_bit/features/profile/presentation/pages/achievement_page/widgets/common/achievement_widget.dart';

class AchievementBody extends StatelessWidget {
  const AchievementBody({super.key, required this.achievements});

  final List<AchievementEntity> achievements;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: StaggeredGrid.count(
        crossAxisCount: 12,
        mainAxisSpacing: 0,
        crossAxisSpacing: 8,
        children: <Widget>[
          for (int index = 0; index < achievements.length; index++) ...<Widget>[
            if (_shouldAddSpacer(index))
              const StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: SizedBox.shrink(),
              ),

            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: AchievementWidget(
                url: achievements[index].url,
                title: achievements[index].title,
                status: achievements[index].status,
                description: achievements[index].description,
                isLocked: achievements[index].isLocked,
              ),
            ),
          ],
        ],
      ),
    );
  }

  bool _shouldAddSpacer(final int index) {
    // Row 1 (indices 0,1,2) -> No spacer
    // Row 2 (indices 3,4) -> Spacer before index 3
    // Row 3 (indices 5,6,7) -> No spacer
    return index == 3 || (index > 3 && (index - 3) % 5 == 0);
  }
}
