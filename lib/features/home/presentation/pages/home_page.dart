import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/home_strings.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/course_card_list.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/level_button_widget.dart';
import 'package:skill_bit/features/home/presentation/widgets/components/home_header_widget.dart';
import '../../../../core/utils/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentLevel = 'Level1';

  @override
  Widget build(final BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: HomeHeaderWidget(
              name: 'Basel',
              //Todo: assessment must be removed if the user have already taken it.
              onTap: () => context.go(AppRoutes.assessment),
              profileUrl: 'Basel_EL_Rafei.jpeg',
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: <Widget>[
                LevelButtonWidget(
                  level: HomeStrings.lvl1,
                  function: () => setState(() => currentLevel = 'Level1'),
                ),
                LevelButtonWidget(
                  level: HomeStrings.lvl2,
                  function: () => setState(() => currentLevel = 'Level2'),
                ),
                LevelButtonWidget(
                  level: HomeStrings.lvl3,
                  function: () => setState(() => currentLevel = 'Level3'),
                ),
              ],
            ),
          ),
        ),
        CourseCardList(
          itemCount: HomeStrings.levels[currentLevel] ?? 0,
          title: 'Introduction to C++',
          imageUrl: Assets.imageLogo('Depth 4, Frame 0.png'),
          //  progressPercentage: 1,
          isLocked: true,
          currentUserLevel: 1,
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    ).pH(10);
  }
}
