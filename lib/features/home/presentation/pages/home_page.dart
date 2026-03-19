import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/state_switcher.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/home/presentation/widgets/components/home_body.dart';
import 'package:skill_bit/features/home/presentation/widgets/components/search_list_widget.dart';
import 'package:skill_bit/features/search/domain/entities/search_courses_entity.dart';
import 'package:skill_bit/features/search/presentation/bloc/search_course_bloc/search_course_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/router/routes.dart';
import '../Bloc/home_bloc.dart';
import '../widgets/components/home_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      // ignore: always_specify_types
      providers: [
        BlocProvider<SearchCourseBloc>(
          create: (final BuildContext context) => sl<SearchCourseBloc>(),
        ),

        BlocProvider<HomeBloc>(
          create: (final BuildContext context) =>
              sl<HomeBloc>()..add(const LoadHomeData(levelId: 'lvl_1')),
        ),
      ],
      child: CustomScrollView(
        slivers: <Widget>[
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

          StateSwitcher<HomeBloc, HomeState>(
            onInitial: (final BuildContext context, final HomeState state) =>
                const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
            onSuccess: (final BuildContext context, final Object? homeState) {
              final HomeSuccess successState = homeState as HomeSuccess;
              final List<CourseEntity> homeCourses = successState.courses;
              final String activeLevel = successState.currentLevelId;

              return StateSwitcher<SearchCourseBloc, SearchCourseState>(
                onInitial:
                    (
                      final BuildContext context,
                      final SearchCourseState searchState,
                    ) {
                      return HomeBody(
                        key: ValueKey((activeLevel)),
                        courses: homeCourses,
                        currentLevel: activeLevel,
                      );
                    },
                onSuccess:
                    (
                      final BuildContext context,
                      final SearchCourseState searchState,
                    ) {
                      final List<SearchCourseEntity> foundCourses =
                          (searchState as SearchCourseSuccess).courses;
                      return SearchListWidget(courses: foundCourses);
                    },
              );
            },
          ),
        ],
      ),
    ).pH(10);
  }
}
