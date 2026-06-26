import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_bit/core/bloc/base_state.dart';
import 'package:skill_bit/features/course/domain/useCases/homeFetching/get_home_data.dart';
import 'package:skill_bit/features/course/domain/useCases/params/level_params.dart';
import '../../../../core/error/failure.dart';
import '../../../course/domain/entities/home_entity.dart';
// import '../../../course/domain/useCases/homeFetching/fetch_courses_by_level_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    //  required this.fetchCoursesByLevelUseCase,
    required this.getHomeData,
  }) : super(HomeInitial()) {
    on<GetHomeData>(_onLoadHomeData);
  }

  //final FetchCoursesByLevelUseCase fetchCoursesByLevelUseCase;
  final GetHomeDataUseCase getHomeData;

  // Future<void> fetchCoursesByLevel(final Emitter<HomeState> emit ,final) async {
  //   emit(HomeLoading());
  //
  // }
  //
  //

  Future<void> _onLoadHomeData(
    final GetHomeData event,
    final Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final Either<Failure, HomeDetailsEntity> result = await getHomeData(
      LevelParams(levelIndex: event.levelId),
    );
    result.fold(
      (final Failure failure) =>
          emit(const HomeError(message: 'failed to get Home Data')),

      (final HomeDetailsEntity homeData) =>
          emit(HomeSuccess(homeDetailsEntity: homeData, levelId: event.levelId)),
    );
  }
}
