import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/constants/home_strings.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/course_card_list.dart';
import 'package:skill_bit/features/home/presentation/widgets/common/level_button_widget.dart';
import 'package:skill_bit/features/home/presentation/widgets/components/home_header_widget.dart';
import 'package:skill_bit/features/search/domain/entities/search_courses_entity.dart';
import 'package:skill_bit/features/search/presentation/bloc/search_course_bloc/search_course_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/assets.dart';
import '../widgets/common/course_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentLevel = 'Level1';

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<SearchCourseBloc>(
      create: (final BuildContext context) => sl<SearchCourseBloc>(),
      child: Builder(
        builder: (final BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              // 1. HEADER
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: HomeHeaderWidget(
                    name: 'Basel',
                    onTap: () => context.go(AppRoutes.assessment),
                    profileUrl: 'Basel_EL_Rafei.jpeg',
                  ),
                ),
              ),

              // 2. DYNAMIC BODY
              BlocBuilder<SearchCourseBloc, SearchCourseState>(
                builder:
                    (
                      final BuildContext context,
                      final SearchCourseState state,
                    ) {
                      if (state is SearchCourseLoading) {
                        return const SliverFillRemaining(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      if (state is SearchCourseSuccess) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate((
                            final BuildContext context,
                            final int index,
                          ) {
                            final SearchCourseEntity course =
                                state.courses![index];

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 10.0,
                              ),
                              child: CourseCardWidget(
                                title: course.title,
                                imageUrl: Assets.image(course.imageUrl),
                                progress: 0.0,
                                isLocked: false,
                              ),
                            );
                          }, childCount: state.courses?.length ?? 0),
                        );
                      }

                      if (state is SearchCourseError) {
                        return SliverToBoxAdapter(
                          child: Center(child: Text(state.message)),
                        );
                      }

                      // (Initial State)
                      return SliverMainAxisGroup(
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  LevelButtonWidget(
                                    level: HomeStrings.lvl1,
                                    function: () =>
                                        setState(() => currentLevel = 'Level1'),
                                  ),
                                  LevelButtonWidget(
                                    level: HomeStrings.lvl2,
                                    function: () =>
                                        setState(() => currentLevel = 'Level2'),
                                  ),
                                  LevelButtonWidget(
                                    level: HomeStrings.lvl3,
                                    function: () =>
                                        setState(() => currentLevel = 'Level3'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CourseCardList(
                            itemCount: HomeStrings.levels[currentLevel] ?? 0,
                            title: 'Introduction to C++',
                            imageUrl: Assets.imageLogo('temp_image.png'),
                            isLocked: true,
                            currentUserLevel: 1,
                          ),
                        ],
                      );
                    },
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 40)),
            ],
          );
        },
      ),
    ).pH(10);
  }
}
