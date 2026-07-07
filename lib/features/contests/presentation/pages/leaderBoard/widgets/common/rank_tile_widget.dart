import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/image_utils.dart';
import 'package:skill_bit/core/widgets/global/shadow_container.dart';
import 'package:skill_bit/core/widgets/user/profile_network_gaurd.dart';

class RankTileWidget extends StatelessWidget {
  const RankTileWidget({
    super.key,
    required this.rank,
    required this.profileUrl,
    required this.name,
    required this.score,
    required this.addFunction,
    required this.badgeUrl,
    required this.viewProfileFunction,
    this.isCurrentUser = false,
  });

  final int rank;
  final String? profileUrl;
  final String? badgeUrl;
  final String name;
  final int score;
  final bool isCurrentUser;
  final void Function()?
  addFunction; //Todo: will be edited to adjust to the friend adding logic
  final void Function()?
  viewProfileFunction; //Todo: will be edited to adjust to the view profile logic

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: viewProfileFunction,
      child: ShadowContainer(
        border: Border.all(
          color: isCurrentUser
              ? context.colorScheme.secondary
              : context.colorScheme.tertiary.withValues(alpha: 0.2),
          width: isCurrentUser ? 2 : 1,
        ),
        boxShadow: isCurrentUser
            ? <BoxShadow>[
              BoxShadow(
                color: context.colorScheme.secondary.withValues(alpha: 0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ]
            : null,
        child: Row(
          children: <Widget>[
            // 1. Rank & Profile
            const SizedBox(width: 5),
            SizedBox(
              width: 30,
              child: Text(
                rank.toString(),
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                ImageUtils.showHeroPreview(
                  context: context,
                  heroTag: 'hero-$name-$rank',
                  profileUrl: profileUrl ?? '',
                );
              },
              child: ProfileNetworkGuardWidget(
                profileUrl: profileUrl ?? '',
                badgeUrl: badgeUrl,
                heroTag: 'hero-$name-$rank',
                width: 25,
                height: 25,
              ),
            ),
            const SizedBox(width: 15),

            // Name
            Expanded(
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: context.colorScheme.outline.withValues(alpha: 0.7),
                ),
              ),
            ),

            const SizedBox(width: 10),
            GestureDetector(
              onTap: addFunction,
              child: ShadowContainer(
                borderRadius: 12,
                child: Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                    border: .all(color: context.colorScheme.primary, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: context.colorScheme.surface,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ),

            // 4. Score
            const SizedBox(width: 20),
            SizedBox(
              width: 45,
              child: Text(
                '$score',
                textAlign: TextAlign.end,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.tertiary,
                ),
              ),
            ),
          ],
        ).pNum(5),
      ),
    );
  }
}
