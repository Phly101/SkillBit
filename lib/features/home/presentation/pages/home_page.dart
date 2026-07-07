import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_bit/core/di/injection_container.dart';
import 'package:skill_bit/core/router/routes.dart';
import 'package:skill_bit/core/theme/theme.dart';
import 'package:skill_bit/core/utils/global/state_switcher.dart';
import 'package:skill_bit/core/widgets/global/error/error_state_widget.dart';
import 'package:skill_bit/core/widgets/home/home_skeleton.dart';
import 'package:skill_bit/features/course/domain/entities/course_entity.dart';
import 'package:skill_bit/features/home/presentation/Bloc/home_bloc.dart';
import 'package:skill_bit/features/home/presentation/widgets/components/home_body.dart';
import 'package:skill_bit/features/home/presentation/widgets/components/home_header_widget.dart';
import 'package:skill_bit/features/home/presentation/widgets/components/search_list_widget.dart';
import 'package:skill_bit/features/search/presentation/bloc/search_course_bloc/search_course_bloc.dart';


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
              sl<HomeBloc>()..add(const GetHomeData(levelId: 1)),
        ),
      ],
      child: CustomScrollView(
        slivers: <Widget>[
          StateSwitcher<HomeBloc, HomeState>(
            loadingWidget: const HomeSkeleton(),
            onInitial: (final BuildContext context, final HomeState state) =>
                const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
            onError:
                (
                  final String message,
                  final BuildContext context,
                  final HomeState state,
                ) => ErrorStateWidget(
                  message: message,
                  reFreshFunction: () => context.read<HomeBloc>().add(
                    const GetHomeData(levelId: 1),
                  ),
                  routeFunction: null,
                ),

            onSuccess: (final BuildContext context, final Object? homeState) {
              final HomeSuccess successState = homeState as HomeSuccess;
              final List<HomeCourseEntity> homeCourses =
                  successState.homeDetailsEntity.courses;

              return SliverMainAxisGroup(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: HomeHeaderWidget(
                        name: successState.homeDetailsEntity.userName,
                        onTap: () => context.go(AppRoutes.assessment),
                        profileUrl: successState.homeDetailsEntity.imageUrl,
                      ),
                    ),
                  ),
                  StateSwitcher<SearchCourseBloc, SearchCourseState>(
                    onInitial:
                        (
                          final BuildContext context,
                          final SearchCourseState searchState,
                        ) {
                          return HomeBody(
                            key: ValueKey(successState.levelId),
                            courses: homeCourses,
                            levelProgress:
                                successState.homeDetailsEntity.levelProgress,
                            currentLevel: successState.levelId,
                            activeStep:
                                successState.homeDetailsEntity.activeStep,
                          );
                        },
                    onSuccess:
                        (
                          final BuildContext context,
                          final SearchCourseState searchState,
                        ) {
                          final List<HomeCourseEntity> foundCourses =
                              (searchState as SearchCourseSuccess).courses;
                          return SearchListWidget(
                            courses: foundCourses
                                .map(
                                  (final HomeCourseEntity e) =>
                                      HomeCourseEntity(
                                        id: e.id,
                                        title: e.title,
                                        description: e.description,
                                        imageUrl: e.imageUrl,
                                        progress: 0,
                                        isLocked: e.isLocked,
                                        courseType: e.courseType,
                                        status: e.status,
                                        isTutorial: e.isTutorial,
                                        isEnrolled: e.isEnrolled,
                                      ),
                                )
                                .toList(),
                          );
                        },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ).pH(10);
  }
}
